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
    @State private var detailThought: Thought?
    @State private var navigation: MenuViewsState = MenuViewsState.home
    @State private var detailNavigation: DetailViewsState = DetailViewsState.list
    
    // user
    let testUser = User(name: "Kranti", email: "darkphoton20@gmail.com")
    
    var body: some View {
        // Primary Wrapper
        VStack {
            VStack {
                // MARK: *** Main Title Area
                MainTitleView(detailNavigation: $detailNavigation, navigation: $navigation)
                
                // Inner Content Wrapper
                VStack {
                    
                    // MARK: *** Main Content Area
                    
                    // MARK: Screen - HOME
                    if(navigation == MenuViewsState.home) {
                        HomeIntroView(info: "Welcome back to your thoughts, \(testUser.name).")
                    }
                    
                    // MARK: Screen - MY THOUGHTS
                    if(navigation == MenuViewsState.thoughts) {
                        if(detailNavigation == .create) {
                            // Create Thought Form
                            CreateThoughtFormView(detailNavigation: $detailNavigation)
                        } else if(detailNavigation == .detail){
                            
                            // Detail Thought
                            DetailThoughtView(detailNavigation: $detailNavigation, thought: detailThought)
                            
                        } else if(detailNavigation == .list) {
                            // Thoughts List
                            ThoughtsListView(detailNavigation: $detailNavigation, detailThought: $detailThought)
                        }
                    }
                    
                    // MARK: Screen - ACCOUNT
                    if(navigation == MenuViewsState.profile) {
                        AccountView()
                    }
                    
                    
                    Spacer()
                    // MARK: *** Navigation Menu
                    MenuView(navigation: $navigation, detailNavigation: $detailNavigation)
                }.padding(.top, 10)
            }.padding(20)
           
            
            Spacer()
        }
        
    }
}

#Preview {
    HomeView()
}
