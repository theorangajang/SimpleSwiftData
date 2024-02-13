//
//  Item.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
