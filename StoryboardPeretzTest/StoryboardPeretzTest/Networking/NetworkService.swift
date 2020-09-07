//
//  NetworkService.swift
//  StoryboardPeretzTest
//
//  Created by Муслим Курбанов on 04.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<[Model], Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error ) in
            DispatchQueue.main.async {
                if let error = error {
                    print("someError")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let model = try JSONDecoder().decode([Model].self, from: data)
                    completion(.success(model))
                    
                } catch let jsonError {
                    print("failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
