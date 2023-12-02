//
//  MainTitleView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct MainTitleView: View {
   var mainTitle: String = "Thoughts"
    @Binding var showCreateThought: Bool
    
    var body: some View {
        HStack {
            Text(mainTitle)
                .font(.system(size: 28, weight: .medium))
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
                    showCreateThought.toggle()
                }
            }) {
                Text(showCreateThought ? "Back" : "Add Thought")
                    .foregroundStyle(.gray)
                
                Image(systemName: showCreateThought ? "arrowshape.turn.up.backward.fill" : "plus")
                        .foregroundStyle(.gray)
                        .padding(.leading, -6)
                
                
            }.padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
}