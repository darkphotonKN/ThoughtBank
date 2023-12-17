//
//  DetailThoughtView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/16.
//

import SwiftUI

struct DetailThoughtView: View {
    @Binding var detailNavigation: DetailViewsState
    var thought: Thought?
    

    var body: some View {
        
        if let thought = thought {
            HStack {
                VStack(alignment: .leading) {
                    // Title
                    Text(thought.title)
                        .font(.system(size: 18, weight: .semibold))
                    // Content
                    Text(thought.content)
                        .padding(.top, 18)
                    
                    // Back Button
                    HStack {
                        Spacer()
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    detailNavigation = .list
                                }
                            }) {
                                Text("Thoughts")
                                    .foregroundStyle(.gray)
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                    .foregroundStyle(.gray)
                            }
                        
                    }
                    
                }
            }
                .foregroundStyle(Color(.systemGray))
            Spacer()
        }
            
    }
}

#Preview {
    DetailThoughtView(detailNavigation: .constant(.detail), thought: Thought(id: "1231", title: "A thought!", content: "Some content of a thought..."))
}
