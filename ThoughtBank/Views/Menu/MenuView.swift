//
//  MenuView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/4.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @Binding var navigation: MenuViews
    @Binding var showCreateThought: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            MenuItem(navigation: $navigation, showCreateThought: $showCreateThought, navigationDest: MenuViews.home, imageName: "house", title: "Home", link: "home")
            MenuItem(navigation: $navigation, showCreateThought: $showCreateThought, navigationDest: MenuViews.thoughts, imageName: "brain", title: "My Thoughts", link: "thoughtsList")
            MenuItem(navigation: $navigation, showCreateThought: $showCreateThought, navigationDest: MenuViews.profile, imageName: "person.crop.circle", title: "Account", link: "account")
        }
    }
}

#Preview {
   HomeView()
}
