//
//  enum.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/8.
//

import Foundation

// toggling main navigation
// - home (HomeIntroView)
// - thoughts (ThoughtListView)
// - profile (AccountView)
enum MenuViewsState {
    case home, thoughts, profile
}

// toggling specific detail navigation views
// - list (ThoughtListView)
//      - detail (DetailThoughtView)
//      - create (CreateThoughtFormView)
enum DetailViewsState {
    case list, create, detail
}
