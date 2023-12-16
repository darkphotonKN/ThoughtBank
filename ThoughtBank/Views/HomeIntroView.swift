//
//  SwiftUIView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/13.
//

import SwiftUI

struct HomeIntroView: View {
    var info: String = ""
    
    var body: some View {
        HStack {
            Text(info)
                .font(.system(size: 16))
                .foregroundStyle(Color(.systemGray))
            Spacer()
        }

    }
}

#Preview {
    HomeView()
}
