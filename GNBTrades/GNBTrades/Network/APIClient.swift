//
//  APIClient.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

class APIClient {
    private let BASE_URL = "http://quiet-stone-2094.herokuapp.com/"
    
    func fetch<T: Codable>(with httpMethod: HTTPMethod, path: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: "\(BASE_URL)\(path)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = ["Accept": "application/json"]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let responseData = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: responseData)
                completion(.success(responseObject))
            } catch let error {
                completion(.failure(error))
            }
            
        }.resume()
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}
