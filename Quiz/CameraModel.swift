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
    var previewLayer: AVCaptureVideoPreviewLayer?
    var output: AVCapturePhotoOutput?
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
    
    private func setup() {}
}
