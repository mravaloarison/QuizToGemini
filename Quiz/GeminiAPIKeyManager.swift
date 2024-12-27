//
//  GeminiAPIKeyManager.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//


import Foundation

enum GeminiAPIKeyManager {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "API_KEYs", ofType: "plist") else {
            fatalError("Couldn't find file API_KEYs.plist")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "GEMINI_API_KEY") as? String else {
            fatalError("Couldn't find key GEMINI_API_KEY")
        }
        return value
    }
}
