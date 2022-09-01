//
//  Publisher.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Combine

extension Publisher where Self.Failure == Never {
    func assign(to published: inout Published<Self.Output>.Publisher,
                completion: () -> Void) {
        assign(to: &published)
        completion()
    }
    
    func append<T>(to array: inout Array<T>) -> AnyPublisher<[T], Never> where Self.Output == [T] {
        self.prepend(array)
            .reduce([], { initialResult, newArray in
                var array = initialResult
                array.append(contentsOf: newArray)
                return array
            })
            .eraseToAnyPublisher()
    }
    
    func uncollect<T>(_ transform: @escaping (Output) -> [T]) -> AnyPublisher<T, Failure> {
      self
        .flatMap { output -> AnyPublisher<T, Failure> in
          JustSeveral(transform(output))
            .setFailureType(to: Failure.self)
            .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
