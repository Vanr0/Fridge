//
//  Product.swift
//  Fridge
//
//  Created by Ivan on 14.08.2025.
//

import Foundation
import SwiftData

@Model
final class Product {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
