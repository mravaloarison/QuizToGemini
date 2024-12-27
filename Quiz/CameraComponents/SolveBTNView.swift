//
//  SolveBTNView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//

import SwiftUI

struct SolveBTNView: View {
    @State var task = AIManager()
    
    var body: some View {
        Button {
            task.Test()
        } label: {
            Label(task.isLoading ? "Loading ..." : "Solve", systemImage: "sparkles")
                .padding()
                .foregroundStyle(.black)
                .background(.white)
                .cornerRadius(15)
        }
    }
}


#Preview {
    SolveBTNView()
}
