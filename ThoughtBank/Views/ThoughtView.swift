//
//  ThoughtView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct ThoughtView: View {
    @Binding var showDetailThought: Bool
    @Binding var detailThought: Thought?
    var thought: Thought
    
    var body: some View {
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                Text(thought.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color(.systemGray))
                Text(thought.content)
                    .font(.system(size: 16, weight: .light))
                    .foregroundStyle(Color(.systemGray2))
            }
                .padding([.top, .bottom], 10)
                .onTapGesture {
                    showDetailThought = true
                    withAnimation(.easeIn(duration: 0.3)) {
                        detailThought = thought                        
                    }
                }
            
            Spacer()
            DeleteThoughtView(thought: thought)
        }
    }
}

#Preview {
    ThoughtView(showDetailThought: .constant(false), detailThought: .constant(Thought(id: "e39d0c85-46c7-46bf-9950-05710b84e8c8", title: "test", content: "This is some thought body.")), thought: Thought(id: "e39d0c85-46c7-46bf-9950-05710b84e8c8", title: "test", content: "This is some thought body."))
}

