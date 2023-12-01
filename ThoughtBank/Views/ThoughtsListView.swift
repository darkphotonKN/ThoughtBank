//
//  ThoughtsListView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct ThoughtsListView: View {
    // initialization for fetching data
    @StateObject var thoughtsListViewModel = ThoughtsListViewModel()
    
    private let thoughtList = [
        Thought(
            id: 1, 
            title: "A random thought..",
            content: "This is the content of some thoughts"
        ),
        Thought(
            id: 2,
            title: "More thoughts",
            content: "This is the content of some thoughts"
        ),
        Thought(
            id: 3,
            title: "Where am I?",
            content: "lorem ipsum."
        ),
    ]
    
    var body: some View {
       
        HStack {
            VStack(alignment: .leading) {
                ForEach(thoughtList) { thought in
                    ThoughtView(thought: thought)
                }
            }
            Spacer()
        }
    }
    
    
}

#Preview {
    HomeView()
}
