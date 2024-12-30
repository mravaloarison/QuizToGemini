//
//  QuizVM.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/29/24.
//

import Foundation
import GoogleGenerativeAI
import UIKit
import SwiftUI


class QuizVM: ObservableObject {
    @Published var res: String = ""
    
    func Test() async {
        do {
            let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKeyManager.default)
            let prompt = "Tell one fact about trump"
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                DispatchQueue.main.async {
                    self.res = text
                }
            }
        } catch let error {
            DispatchQueue.main.async {
                self.res = "Error: \(error)"
            }
        }
    }
    
    func fetchAIResponse(image: UIImage) async {
        do {
            let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKeyManager.default)
            let prompt = "Describe the pic in one sentence"
            let response = try await model.generateContent(image, prompt)
            if let text = response.text {
                DispatchQueue.main.async {
                    self.res = text
                    print("Res: \(text)")
                }
            }
        } catch let error {
            DispatchQueue.main.async {
                self.res = "Error: \(error)"
                print("Error: \(error)")
            }
        }
    }
}
