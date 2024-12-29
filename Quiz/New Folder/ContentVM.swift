//
//  ContentVM.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//

import UIKit

enum Constants {
    static let placeholder = UIImage(systemName: "photo.fill")!
}

@Observable
class ContentVM {
    var data: Data?
        
    var cameraImage: UIImage?
    
    var image: UIImage {
        if let data, let uiImage = UIImage(data: data) {
            return uiImage
        } else {
            return Constants.placeholder
        }
    }
    
    init() {}
    
    @MainActor
    func clearImage() {
        data = nil
    }
}
