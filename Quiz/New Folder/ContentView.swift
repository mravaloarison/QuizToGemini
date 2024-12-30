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
    @StateObject var quiz: QuizVM
    @State private var imagePicker = ImagePicker()
    @State private var CameraError: CameraPermission.CameraError?
    @State private var CameraAccessAllowed: Bool = false
    @State private var showCamera = false
    @State var isLoading = false
    @State var showRes = false
    
    var body: some View {
        VStack {
            if vm.data != nil {
                Image(uiImage: vm.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                if showRes {
                    Text(isLoading ? "Loading ..." : quiz.res)
                        .fontWeight(.bold)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            HStack {
                Button(vm.data != nil ? "Retake" : "Camera", systemImage: "camera") {
                    if let error = CameraPermission.checkPermissions() {
                        CameraError = error
                    } else {
                        showCamera.toggle()
                    }
                    showRes = false
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
                if (vm.data != nil) {
                    Spacer()
                    Button("Solve", systemImage: "sparkles") {
                        isLoading = true
                        showRes = true
                        Task {
                            await quiz.fetchAIResponse(image: vm.image)
                            isLoading = false
                        }
                    }
                }
            }
            .padding()
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
    ContentView(vm: ContentVM(), quiz: QuizVM())
}
