//
//  ThoughtsListViewModel.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/29.
//

import Foundation

struct ThoughtDataApiResponse: Codable {
    var data: [Thought]
}

final class ThoughtsListViewModel: ObservableObject {
    
    @Published var thoughtsList: [Thought]?
    
    init() {
        // fetch the intial data
        fetchThoughts()
    }
    
    func fetchThoughts() {
        let urlEndpoint = "/api/thoughts"
        
        NetworkManager.shared.getRequest(url: urlEndpoint) { (result: Result<ThoughtDataApiResponse, Error>) in
            // perform async update of state
            DispatchQueue.main.async {
                switch result {
                case .success(let apiResponse):
                    print("DEBUG success response: \(apiResponse)")
                    self.thoughtsList = apiResponse.data
                case .failure(let error):
                    print("DEBUG error after GET request: \(error)")
                    
                }
            }
        }
        
        
    }
    
    
}
