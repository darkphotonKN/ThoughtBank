//
//  MenuItem.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/4.
//

import Foundation
import SwiftUI

struct MenuItem: View {
    @Binding var navigation: String
    var imageName: String = ""
    var title: String = ""
    var link: String = ""
    
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color(.systemGray))
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 4)
                .foregroundStyle(Color(.systemGray))
        
        }.onTapGesture {
            withAnimation(.easeIn(duration: 0.3)) {
                navigation = "thoughtslist"
            }
        }
    }
}