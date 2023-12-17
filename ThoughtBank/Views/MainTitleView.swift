//
//  MainTitleView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct MainTitleView: View {
    var mainTitle: String = "Thoughts"
    @Binding var detailNavigation: DetailViewsState
    @Binding var navigation: MenuViewsState
    
    var body: some View {
        
        HStack {
            Text(mainTitle)
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(Color(.systemGray))
            Image(systemName: "brain.head.profile.fill")
                .resizable()
                .frame(width: 16, height: 18)
                .padding(.top, 4)
                .padding(.leading, -4)
                .foregroundStyle(.gray)

            
            Spacer()
            Button(action: {
                withAnimation(.easeIn(duration: 0.3)) {
                    // check if already inside create thought view
                    if (detailNavigation == .create) {
                        // exit out of there
                        detailNavigation = .list
                    } else {
                        // show the create thought view
                        detailNavigation = .create
                    }
                    
                    // change navigation to thought list to be able to
                    // show the create thought view
                    navigation = MenuViewsState.thoughts
                }
            }) {
                Text(detailNavigation == .create ? "Back" : "Add Thought")
                    .foregroundStyle(.gray)
                
                Image(systemName: detailNavigation == .create ? "arrowshape.turn.up.backward.fill" : "plus")
                        .foregroundStyle(.gray)
                        .padding(.leading, -6)
                
                
            }.padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
}
