//
//  Item.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
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
