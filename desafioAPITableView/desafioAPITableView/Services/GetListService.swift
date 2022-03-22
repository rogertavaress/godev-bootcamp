//
//  GetListService.swift
//  desafioAPITableView
//
//  Created by Rogério Tavares on 21/03/22.
//

import Foundation
import Alamofire

enum GetListServiceError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol GetListServiceProtocol {
    func execute(completion: @escaping (Result<[CEOModel], GetListServiceError>) -> Void)
}

struct GetListService: GetListServiceProtocol {
    private let session = URLSession.shared
    private let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: GetListService {
        let instance = GetListService()
        return instance
    }
    
    func execute(completion: @escaping (Result<[CEOModel], GetListServiceError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.urlInvalid))
            return
        }
        
        AF.request(url, method: .get).validate().responseDecodable(of: [CEOModel].self) { response in
            guard let CEOs = response.value else { return }
            
            completion(.success(CEOs))
        }
        
//        let dataTask = session.dataTask(with: url) { data, _, _ in
//            do {
//                guard let jsonData = data else {
//                    completion(.failure(.noDataAvailable))
//                    return
//                }
//
//                let decoder = JSONDecoder()
//
//                let response = try decoder.decode([CEOModel].self, from: jsonData)
//
//                completion(.success(response))
//            } catch {
//                completion(.failure(.noProcessData))
//            }
//        }
//
//        dataTask.resume()
    }
}
