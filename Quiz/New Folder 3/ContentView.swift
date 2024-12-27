//
//  ContentView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @State var vm: ContentVM
    @State private var CameraError: CameraPermission.CameraError?
    @State private var CameraAccessAllowed: Bool = false
    
    var body: some View {
        ZStack {
            if CameraAccessAllowed {
                UIKitCamera(selectedImage: $vm.cameraImage)
                    .ignoresSafeArea()
            } else {
                Text("You need to allow access to camera.")
            }
        }
        .onChange(of: vm.cameraImage) {
            if let image = vm.cameraImage {
                vm.data = image.jpegData(compressionQuality: 0.8)
            }
        }
        .onAppear {
            if let error = CameraPermission.checkPermissions() {
                CameraError = error
            } else {
                CameraAccessAllowed = true
            }
        }
    }
}

#Preview {
    ContentView(vm: ContentVM())
}
