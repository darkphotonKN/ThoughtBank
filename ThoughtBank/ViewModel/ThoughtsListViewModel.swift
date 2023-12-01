//
//  ThoughtsListViewModel.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/29.
//

import Foundation


final class ThoughtsListViewModel: ObservableObject {
    
    @Published var thoughtsList: [Thought]?
    
    init() {
        print("init!")
        // fetch the intial data
        fetchThoughts()
    }
    
    func fetchThoughts() {
        guard let urlObject = URL(string: "http://172.20.10.4/api/thoughts")
            else {
                print("urlObject creation failed!")
                return
            }
        
        print("urlObject successfully created: \(urlObject)")
        URLSession.shared.dataTask(with: urlObject) { data, response, error in
            print("data:", data)
            print("error: \(error)")
            if let data = data {
                print(data)
            }
            
        }
        
    }
    
    
}
