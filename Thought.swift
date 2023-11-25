//
//  Thought.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/26.
//

import Foundation


struct Thought: Identifiable, Codable {
    var id: Int
    var title: String
    var content: String
}
