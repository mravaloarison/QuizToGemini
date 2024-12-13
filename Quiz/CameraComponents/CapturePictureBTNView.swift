//
//  CapturePictureBTNView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//


struct CapturePictureBTNView: View {
    @StateObject var camera = CameraModel()

    var body: some View {
        Button {
            camera.isTaken.toggle()
        } label: {
            ZStack {
                Circle()
                    .fill(.thickMaterial)
                    .frame(width: 69, height: 69)
                Circle()
                    .stroke(.thickMaterial, lineWidth: 3)
                    .frame(width: 81, height: 81)
            }
        }
    }
}