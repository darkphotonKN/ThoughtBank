//
//  ThoughtView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct ThoughtView: View {
    var thought: Thought
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(thought.title)
                .font(.system(size: 22, weight: .medium))
            Text(thought.content)
                .font(.system(size: 18, weight: .light))
        }.padding([.top, .bottom], 10)
    }
}

#Preview {
    ContentView()
}

