//
//  Card.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import Foundation
import SwiftData

@Model
final class Card {
    
    var front: String
    var back: String
    var creationDate: Date

    init(front: String, back: String, creationDate: Date = .now) {
        self.front = front
        self.back = back
        self.creationDate = creationDate
    }
    
}

extension Card: Identifiable { }

extension Card: Hashable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.front == rhs.front &&
        lhs.back == rhs.back &&
        lhs.creationDate == rhs.creationDate
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(front)
        hasher.combine(back)
        hasher.combine(creationDate)
    }
    
}
