//
//  CameraView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//

import SwiftUI

struct CameraView: View {
    @State var camera = CameraModel()
    
    var body: some View {
        ZStack {
            CameraPreview(camera: $camera)
                .ignoresSafeArea(.all, edges: .all)
                .onAppear() {
                    camera.requestAccessAndSetup()
                }
            
            VStack {
                if camera.isTaken {
                    CloseBTNView(camera: camera)
                }
                
                Spacer()
                
                if camera.isTaken {
                    SolveBTNView()
                } else {
                    CapturePictureBTNView(camera: camera)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CameraView()
}
