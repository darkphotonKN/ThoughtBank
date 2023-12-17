//
//  MenuView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/4.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @Binding var navigation: MenuViewsState
    @Binding var detailNavigation: DetailViewsState
    
    var body: some View {
        HStack(spacing: 12) {
            MenuItem(navigation: $navigation, detailNavigation: $detailNavigation, navigationDest: MenuViewsState.home, imageName: "house", title: "Home", link: "home")
            MenuItem(navigation: $navigation, detailNavigation: $detailNavigation, navigationDest: MenuViewsState.thoughts, imageName: "brain", title: "My Thoughts", link: "thoughtsList")
            MenuItem(navigation: $navigation, detailNavigation: $detailNavigation, navigationDest: MenuViewsState.profile, imageName: "person.crop.circle", title: "Account", link: "account")
        }
    }
}

#Preview {
   HomeView()
}
