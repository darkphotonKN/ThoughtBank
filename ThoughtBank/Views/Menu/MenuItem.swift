//
//  MenuItem.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/4.
//

import Foundation
import SwiftUI

struct MenuItem: View {
    @Binding var navigation: MenuViewsState
    @Binding var detailNavigation: DetailViewsState
    
    var navigationDest: MenuViewsState
    var imageName: String = ""
    var title: String = ""
    var link: String = ""
    
    
    var body: some View {
       
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color(.systemGray))
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.top, 4)
                    .foregroundStyle(Color(.systemGray))
                
            }.onTapGesture {
                withAnimation(.easeIn(duration: 0.3)) {
                    // hide create thought view if active
                    if(detailNavigation == .create) {
                        detailNavigation = .list
                    }
                    // navigate to new page
                    navigation = navigationDest
                }
            }
        
    }
}

#Preview {
    HomeView()
}
