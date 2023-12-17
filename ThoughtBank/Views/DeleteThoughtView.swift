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
        print("Deleting thought with id: \(thoughtId)")
        
        let mobileIP = "172.20.10.4"
        let officeIP = "10.1.6.21"
        let homeWifiIP = "10.0.0.110"
        
        let url = "http://\(homeWifiIP):3000/api/thoughts/delete?id=\(thoughtId)"
        
        
        NetworkManager.shared.deleteRequest(url: url)  { response in
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
