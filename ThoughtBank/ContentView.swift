//
//  ContentView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // Primary Wrapper
        VStack {
            // Main Title Area
            MainTitleView()
            
            // Thoughts List
            ThoughtsListView()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
