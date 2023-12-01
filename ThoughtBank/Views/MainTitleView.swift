//
//  MainTitleView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct MainTitleView: View {
   var mainTitle: String = "ThoughtBank"
    @Binding var showCreateThought: Bool
    
    var body: some View {
        HStack {
            Text(mainTitle)
                .font(.system(size: 28, weight: .medium))
            Image(systemName: "pencil.line")
                .resizable()
                .frame(width: 12, height: 12)
                .padding(.top, 8)
                .padding(.leading, -8)

            
            Spacer()
            Button(action: {
                showCreateThought.toggle()
            }) {
                Text(showCreateThought ? "Back" : "Add Thought")
                    .foregroundStyle(.black)
                
                Image(systemName: showCreateThought ? "arrowshape.turn.up.backward.fill" : "plus")
                        .foregroundStyle(.black)
                        .padding(.leading, -6)
                
            }.padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
}
