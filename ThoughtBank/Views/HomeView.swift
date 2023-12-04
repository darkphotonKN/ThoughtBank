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
    @State var navigation: String = "home"
    
    var body: some View {
        // Primary Wrapper
        VStack {
            VStack {
                // Main Title Area
                MainTitleView(showCreateThought: $showCreateThought)
                
                
                // Main Content Area
                
                
                // Thoughts List Screen
                if(navigation == "thoughtslist") {
                    if(showCreateThought) {
                        // Create Thought Form
                        CreateThoughtFormView()
                        
                    } else {
                        // Thoughts List
                        ThoughtsListView()
                        
                    }
                }
                Spacer()
                MenuView(navigation: $navigation)
            }.padding(20)
           
            
            Spacer()
        }
        
    }
}

#Preview {
    HomeView()
}
