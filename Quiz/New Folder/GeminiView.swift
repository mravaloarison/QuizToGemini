//
//  GeminiView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/26/24.
//

import SwiftUI
import GoogleGenerativeAI

struct GeminiView: View {
    @StateObject var Quiz = QuizVM()
    @Binding var isLoading: Bool
    
    var body: some View {
        Text(isLoading ? "Loading ..." : Quiz.res)
            .fontWeight(.bold)
            .font(.title3)
            .multilineTextAlignment(.center)
    }
}
