//
//  GeminiView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//

import SwiftUI

struct GeminiView: View {
    @State var vm = ContentVM()
    
    var body: some View {
        Image(uiImage: vm.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
    }
}

#Preview {
    GeminiView()
}
