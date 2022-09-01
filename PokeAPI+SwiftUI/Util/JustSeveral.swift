//
//  JustSeveral.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//

import Combine

struct JustSeveral<Value>: Publisher {
    typealias Output = Value
    typealias Failure = Never
    
    private let outputs: [Value]
    
    init(_ outputs: [Value]) {
        self.outputs = outputs
    }
    
    func receive<Downstream: Subscriber>(subscriber: Downstream) where Downstream.Input == Output, Downstream.Failure == Failure {
        let subject = PassthroughSubject<Value, Never>()
        subject
            .subscribe(subscriber)
        
        outputs.forEach { subject.send($0) }
        subject.send(completion: .finished)
    }
}
