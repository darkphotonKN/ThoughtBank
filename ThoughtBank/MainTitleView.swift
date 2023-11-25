//
//  MainTitleView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct MainTitleView: View {
    private var mainTitle: String = "ThoughtBank"
    
    var body: some View {
        HStack {
            Text(mainTitle)
                .font(.system(size: 28, weight: .medium))
            
            Spacer()
            Button(action: {
                print("Adding new thought...")
            }) {
                Text("Add Thought")
                    .foregroundStyle(.black)
            }
            Image(systemName: "plus")
        }
    }
}
