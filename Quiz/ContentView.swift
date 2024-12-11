//
//  ContentView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/9/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var captureSession: AVCaptureSession?
    @State private var photoOutput: AVCapturePhotoOutput?
    @State private var isSessionConfigured = false
    
    var body: some View {
        VStack {
            Button("Capture Photo") {
                // sum
            }
        }
        .padding()
        .onAppear {
            Task {
                await setUpCaptureSession()
            }
        }
    }
    
    var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            var isAuthorized = status == .authorized
            
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
    
    func setUpCaptureSession() async {
        guard await isAuthorized else { return }
        // Set up the capture session.
        
    }
}

#Preview {
    ContentView()
}
