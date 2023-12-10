//
//  ThoughtsListViewModel.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/11/29.
//

import Foundation

struct ThoughtDataApiRepsonse: Codable {
    var data: [Thought]
}

final class ThoughtsListViewModel: ObservableObject {
    
    @Published var thoughtsList: [Thought]?
    
    init() {
        print("init!")
        // fetch the intial data
        fetchThoughts()
    }
    
    func fetchThoughts() {
        let mobileIP = "172.20.10.4"
        let officeIP = "10.1.6.21"
        guard let urlObject = URL(string: "http://\(mobileIP):3000/api/thoughts")
            else {
                print("urlObject creation failed!")
                return
            }
        
        print("urlObject: \(urlObject)")
        URLSession.shared.dataTask(with: urlObject) { data, response, error in
            if let error = error {
                        print("Error fetching thoughts: \(error)")
                        return
                    }
            
            guard let data = data else { return }
            
//            print("Raw data string: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
            
            // Attempt to decode the data
            DispatchQueue.main.async {
                do {
                    // convert data to JSON object
                    let decodedData = try JSONDecoder().decode(ThoughtDataApiRepsonse.self, from: data)
                    self.thoughtsList = decodedData.data
//                    print("decodedData: \(decodedData)")
                } catch {
                    print("Error decoding thoughts: \(error)")
                }
            }
               
            
        }.resume()
        
    }
    
    
}
