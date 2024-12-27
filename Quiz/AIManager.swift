//
//  AIManager.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//

import Foundation
import GoogleGenerativeAI
import SwiftUI

@Observable
class AIManager {
    var camera = CameraModel()
    var isLoading = false
    
    func SayHi() {
        Task {
            isLoading.toggle()

            do {
                let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: GeminiAPIKeyManager.default)
                let prompt = "Write one line about trump"
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    print("AI res: \(text)")
                    isLoading.toggle()
                }
            } catch {
                print("Something went wrong while trying to use gemini")
                isLoading.toggle()
            }
        }
    }
    
    func Test() {
        print("State of photo: \(camera.photoState)")
        /*
        Task {
            isLoading = true
            
            do {
                let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: GeminiAPIKeyManager.default)
                let prompt = "Caption this image."
                
                let response = try await model.generateContent(..., prompt)
                
                if let text = response.text {
                    print("Gemini Response: \(text)")
                } else {
                    print("No text returned from Gemini.")
                }
            } catch {
                print("Error while processing the image: \(error.localizedDescription)")
            }
            
            isLoading = false
        }
         */
    }
}
