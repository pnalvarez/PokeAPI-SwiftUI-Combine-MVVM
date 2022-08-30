//
//  API.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Combine
import Foundation

protocol APIProtocol {
    func request<T: Decodable>(endpoint: EndpointProtocol) -> AnyPublisher<T, Error>
}

enum APIError: Error {
    case url
    case genericError(_ message: String)
}

final class API {
    private let basePath: String = "https://pokeapi.co/api/v2/"
    
    private func makeExtraHeaders(from endpoint: EndpointProtocol) -> String? {
        var headerString = "?"
        guard var headers = endpoint.headers,
              let first = headers.first else {
            return nil
        }
        
        headerString += "\(first.key)=\(first.value)"
        headers.removeValue(forKey: first.key)
        
        for (key, value) in headers {
            headerString += "&\(key)=\(value)"
        }
        return headerString
    }
}

extension API: APIProtocol {
    func request<T: Decodable>(endpoint: EndpointProtocol) -> AnyPublisher<T, Error> {
        let path = basePath + endpoint.path + (makeExtraHeaders(from: endpoint) ?? "")
        guard let url = URL(string: path) else {
            return Fail(error: APIError.url)
                .eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.httpBody = endpoint.body
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .mapError({
                APIError.genericError($0.localizedDescription)
            })
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .handleEvents(receiveOutput: { print("Received output: \($0)")})
            .eraseToAnyPublisher()
    }
}
