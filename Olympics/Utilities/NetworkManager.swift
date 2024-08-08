//
//  NetworkManager.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()

    func fetch<T: Decodable>(url: URL, type: T.Type) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
