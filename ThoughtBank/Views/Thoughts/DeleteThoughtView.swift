//
//  DeleteThoughtView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/10.
//

import Foundation
import SwiftUI

struct DeleteItem: Codable {
    var id: UUID
}

struct DeleteThoughtView: View {
    var thought: Thought 
    
    func deleteThought(thoughtId: String) {
        
        let urlEndpoint = "/api/thoughts/delete?id=\(thoughtId)"
        
        NetworkManager.shared.deleteRequest(url: urlEndpoint)  { response in
            print("Item deleted: \(response)")
            
        }
    }
    
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .onTapGesture {
                if let thoughtId = thought.id {
                    deleteThought(thoughtId: thoughtId)
                }
                
            }
    }
}


#Preview {
    HomeView()
}
