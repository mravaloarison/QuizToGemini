//
//  SolveBTNView.swift
//  Quiz
//
//  Created by Mami Ravaloarison on 12/13/24.
//

import SwiftUI

struct SolveBTNView: View {
    var body: some View {
        Button {
            //
        } label: {
            HStack (spacing: 0) {
                Text("Solve")
                    .padding(.horizontal, 20)
            
                Image(systemName: "wand.and.stars")
                    .padding()
            }
            .foregroundColor(.black)
            .background(.white)
            .clipShape(.capsule)
        }
    }
}


#Preview {
    SolveBTNView()
}
