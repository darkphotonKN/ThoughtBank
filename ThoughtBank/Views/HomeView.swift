//
//  ContentView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct User {
    var name: String
    var email: String
}

struct HomeView: View {
    @State private var thoughts: [Thought] = [Thought]()
    @State private var showCreateThought: Bool = false
    @State private var showDetailThought: Bool = false
    @State private var detailThought: Thought?
    @State private var navigation: MenuViews = MenuViews.home
    
    // user
    let testUser = User(name: "Kranti", email: "darkphoton20@gmail.com")
    
    var body: some View {
        // Primary Wrapper
        VStack {
            VStack {
                // MARK: *** Main Title Area
                MainTitleView(showCreateThought: $showCreateThought, navigation: $navigation)
                
                // Inner Content Wrapper
                VStack {
                    
                    // MARK: *** Main Content Area
                    
                    // MARK: Screen - HOME
                    if(navigation == MenuViews.home) {
                        HomeIntroView(info: "Welcome back to your thoughts, \(testUser.name).")
                    }
                    
                    // MARK: Screen - MY THOUGHTS
                    if(navigation == MenuViews.thoughts) {
                        if(showCreateThought) {
                            // Create Thought Form
                            CreateThoughtFormView(showCreateThought: $showCreateThought)
                        } else if(showDetailThought){
                            
                            // Detail Thought
                            DetailThoughtView(showDetailThought: $showDetailThought, thought: detailThought)
                            
                        } else {
                            // Thoughts List
                            ThoughtsListView(showDetailThought: $showDetailThought, detailThought: $detailThought)
                        }
                    }
                    
                    // MARK: Screen - ACCOUNT
                    if(navigation == MenuViews.profile) {
                        AccountView()
                    }
                    
                    
                    Spacer()
                    // MARK: *** Navigation Menu
                    MenuView(navigation: $navigation, showCreateThought: $showCreateThought)
                }.padding(.top, 10)
            }.padding(20)
           
            
            Spacer()
        }
        
    }
}

#Preview {
    HomeView()
}
