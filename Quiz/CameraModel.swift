//
//  CameraModel.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/11/24.
//

import Foundation
import AVFoundation
import SwiftUI

@Observable
class CameraModel: NSObject {
    
    enum PhotoState {
        case notTaken
        case processing
        case taken(Data)
    }
    
    var session = AVCaptureSession()
    var previewLayer = AVCaptureVideoPreviewLayer()
    var output = AVCapturePhotoOutput()
    var isTaken: Bool = false
    
    var picTaken: Data? {
        if case .taken(let data) = photoState {
            return data
        }
        return nil
    }
    
    var image: UIImage? 
    
    private(set) var photoState: PhotoState = .notTaken
    
    func requestAccessAndSetup() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { success in
                    self.setup()
                }
            case .authorized:
                setup()
            default:
                print("")
        }
    }
    
    private func setup() {
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        do {
            guard let device = AVCaptureDevice.default(for: .video) else {
                return
            }
            let input = try AVCaptureDeviceInput(device: device)
            
            guard session.canAddInput(input) else {
                return
            }
            session.addInput(input)
            
            guard session.canAddOutput(output) else {
                return
            }
            session.addOutput(output)
            
            session.commitConfiguration()
            
            Task(priority: .background) {
                self.session.startRunning()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func takePhoto() {
        guard case .notTaken = photoState else { return }
        
        isTaken.toggle()
        
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        withAnimation {
            self.photoState = .processing
        }
    }
    
    func retakePhoto() {
        isTaken.toggle()
        
        Task(priority: .background) {
            self.session.startRunning()
            await MainActor.run {
                self.photoState = .notTaken
            }
        }
    }
}

extension CameraModel: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        if let error {
            print(error.localizedDescription)
        }
        
        guard let imgData = photo.fileDataRepresentation() else { return }
        
        Task(priority: .background) {
            self.session.stopRunning()
            await MainActor.run {
                withAnimation {
                    self.photoState = .taken(imgData)
                }
            }
        }
    }
}
