//
//  CapturePictureBTNView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//

import SwiftUI

struct CapturePictureBTNView: View {
    @State var camera: CameraModel

    var body: some View {
        Button {
            camera.isTaken.toggle()
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 69, height: 69)
                Circle()
                    .stroke(.thinMaterial, lineWidth: 3)
                    .frame(width: 81, height: 81)
            }
        }
    }
}
