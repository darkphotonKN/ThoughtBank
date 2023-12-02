//
//  ContentView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct HomeView: View {
    @State var thoughts: [Thought] = [Thought]()
    @State var showCreateThought: Bool = false
    
    var body: some View {
        // Primary Wrapper
        VStack {
            VStack {
                // Main Title Area
                MainTitleView(showCreateThought: $showCreateThought)
                
                
                // Main Content Area
                
                if(showCreateThought) {
                    // Create Thought Form
                    CreateThoughtFormView()
                    
                } else {
                    // Thoughts List
                    ThoughtsListView()
                    
                }
                
                
            }.padding(20)
           
            
            Spacer()
        }
        
    }
}

#Preview {
    HomeView()
}
