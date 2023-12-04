//
//  Thought.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import Foundation
import SwiftUI


struct Thought: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}
