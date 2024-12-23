//
//  CameraModel.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/11/24.
//

import Foundation
import AVFoundation

@Observable
class CameraModel {
    var session = AVCaptureSession()
    var previewLayer = AVCaptureVideoPreviewLayer()
    var output = AVCapturePhotoOutput()
    var isTaken: Bool = false
    
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
}
