//
//  DeckModel.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftData

@Model
class DeckModel {
    @Attribute(.unique) var id: String
    var price: Int
    var isSave: Bool
    var recipes: [String]
    
    init(price: Int, isSave: Bool, recipes: [String]) {
        self.id = UUID().uuidString
        self.price = price
        self.isSave = isSave
        self.recipes = recipes
    }
}
