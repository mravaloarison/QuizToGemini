//
//  QuizApp.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/9/24.
//

import SwiftUI

@main
struct QuizApp: App {
    var body: some Scene {
        WindowGroup {
            // CameraView()
            ContentView(vm: ContentVM())
        }
    }
}
