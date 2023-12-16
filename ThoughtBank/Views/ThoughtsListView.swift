//
//  ThoughtsListView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI
import Algorithms

struct ThoughtsListView: View {
    // initialization for fetching data
    @StateObject var thoughtsListViewModel = ThoughtsListViewModel()
    @Binding var showDetailThought: Bool
    @Binding var detailThought: Thought?
    
    var body: some View {
        
        HStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                        if let thoughtListData = thoughtsListViewModel.thoughtsList {
                            ForEach(thoughtListData) { thought in
                                ThoughtView(showDetailThought: $showDetailThought, detailThought: $detailThought, thought: thought)
                            }
                        } else {
                            ProgressView()
                        }
                    
                    }
                    Spacer()
            }
            Spacer()
        }
        
    }
}

#Preview {
    HomeView()
}
