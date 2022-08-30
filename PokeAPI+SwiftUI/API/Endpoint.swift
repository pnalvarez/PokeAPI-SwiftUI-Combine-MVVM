//
//  Endpoint.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Foundation

protocol EndpointProtocol {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String : String]? { get }
    var body: Data? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
    case delete = "DELETE"
}
