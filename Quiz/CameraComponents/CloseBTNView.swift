//
//  CloseBTNView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//

import SwiftUI

struct CloseBTNView: View {
    @State var camera: CameraModel
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                camera.retakePhoto()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
            }
        }
    }
}
