//
//  MenuView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/4.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @Binding var navigation: String
    
    var body: some View {
        HStack(spacing: 12) {
            MenuItem(navigation: $navigation, imageName: "house", title: "Home", link: "home")
            MenuItem(navigation: $navigation, imageName: "brain", title: "My Thoughts", link: "thoughtsList")
            MenuItem(navigation: $navigation, imageName: "person.crop.circle", title: "Account", link: "account")
        }
    }
}

#Preview {
   HomeView()
}
