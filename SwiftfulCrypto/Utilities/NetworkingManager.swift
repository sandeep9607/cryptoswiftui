//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 13/04/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError{
        case badURLResponse
        case unknown
        
        var errorDescription: String? {
            switch self{
            case .badURLResponse: return "[🔥] Bad response from URL."
            case .unknown: return "[⚠️] unknown error occured"
            }
        }
    }
    
    static func download(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(String(describing: error))
        }
    }
}
