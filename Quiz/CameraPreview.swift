//
//  CameraPreview.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//

import AVFoundation
import SwiftUI

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: camera.session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        
        view.layer.addSublayer(previewLayer)
        camera.previewLayer = previewLayer
        
        camera.startSession()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        camera.previewLayer?.frame = uiView.bounds
    }
}

