//
//  ContentView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/9/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject var camera = CameraModel()

    var body: some View {
        CameraView()
    }
}

#Preview {
    ContentView()
}
