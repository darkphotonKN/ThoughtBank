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
    
    var body: some View {
       
        HStack {
            VStack(alignment: .leading) {
                if let thoughtListData = thoughtsListViewModel.thoughtsList {
                    ForEach(thoughtListData) { thought in
                        ThoughtView(thought: thought)
                        
                    }
                } else {
                    ProgressView()
                }
            }
            Spacer()
        }
    }
    
    
}

#Preview {
    HomeView()
}
