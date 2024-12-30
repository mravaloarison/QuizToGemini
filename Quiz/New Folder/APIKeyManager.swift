//
//  APIKeyManager.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/29/24.
//

import Foundation

enum APIKeyManager {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "API_key", ofType: "plist") else {
            fatalError("Couldn't find file API_Key.plist")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "GEMINI_API_KEY") as? String else {
            fatalError("Couldn't find key GEMINI_API_KEY")
        }
        return value
    }
}
