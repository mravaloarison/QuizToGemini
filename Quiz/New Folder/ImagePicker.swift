//
//  ImagePicker.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//


import SwiftUI
import PhotosUI

@Observable
class ImagePicker {
    var image: Image?
    var images: [Image] = []
  
    var vm: ContentVM?
    
    func setup(_ vm: ContentVM) {
        self.vm = vm
    }
    var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    @MainActor
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                vm?.data = data
                if let uiImage = UIImage(data: data) {
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
}
