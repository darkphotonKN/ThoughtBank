//
//  NetworkManager.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/4.
//

import Foundation

class NetworkManager {
    // instantiate singleton instance
    static var shared = NetworkManager()
    
    func postRequest<T: Encodable>(url: String, payload: T, completion: @escaping (Result<Data, Error>) -> Void) {
        
        // guard against any unaccepted url strings and create URL object
        guard let url = URL(string: url) else { return }
        
        // create a URLRequest object
        var request = URLRequest(url: url)
        // set http method to POST
        request.httpMethod = "POST"
            
        // set Content-Type headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // attempt to encode JSON
        do {
            let jsonData = try JSONEncoder().encode(payload)
            request.httpBody = jsonData // set body of request with json data
            
        } catch {
            completion(.failure(error))
        }
        
        // make post request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // check for errors
            guard let error = error else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            // check for any data reponse
            if let data = data {
                completion(.success(data))
            }
        }
        
        // initialize task
        task.resume()
                
    }
}
