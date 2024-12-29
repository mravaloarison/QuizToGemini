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
    @State private var imagePicker = ImagePicker()
    @State private var CameraError: CameraPermission.CameraError?
    @State private var CameraAccessAllowed: Bool = false
    @State private var showCamera = false
    
    var body: some View {
        VStack {
            if vm.data != nil {
                Image(uiImage: vm.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
            }
            Button(vm.data != nil ? "Retake" : "Camera", systemImage: "camera") {
                if let error = CameraPermission.checkPermissions() {
                    CameraError = error
                } else {
                    showCamera.toggle()
                }
            }
            .alert(isPresented: .constant(CameraError != nil), error: CameraError) { _ in
                Button("OK") {
                    CameraError = nil
                }
            } message: { error in
                Text(error.recoverySuggestion ?? "Try again later")
            }
            .sheet(isPresented: $showCamera) {
                UIKitCamera(selectedImage: $vm.cameraImage)
                    .ignoresSafeArea()
            }
        }
        .onChange(of: vm.cameraImage) {
            if let image = vm.cameraImage {
                vm.data = image.jpegData(compressionQuality: 0.8)
            }
        }
        .onAppear {
            imagePicker.setup(vm)
        }
    }
}

#Preview {
    ContentView(vm: ContentVM())
}
