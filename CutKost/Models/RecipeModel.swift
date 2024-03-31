//
//  RecipeModel.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftData

@Model
class RecipeModel: Codable {
    
    @Attribute(.unique) var id: String
    var name: String
    var desc: String
    var ingridients: [String]
    var steps: [String]
    var time: Int
    var price: Int
    var image: String
    var video: String
    
    enum CodingKeys: CodingKey {
        case id, name, desc, ingridients, steps, time, price, image, video
    }
    
    init(name: String, desc: String, ingridients: [String], steps: [String], time: Int, price: Int, image: String, video: String) {
        self.id = UUID().uuidString
        self.name = name
        self.desc = desc
        self.ingridients = ingridients
        self.steps = steps
        self.time = time
        self.price = price
        self.image = image
        self.video = video
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        self.name = try container.decode(String.self, forKey: .name)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.ingridients = try container.decode([String].self, forKey: .ingridients)
        self.steps = try container.decode([String].self, forKey: .steps)
        self.time = try container.decode(Int.self, forKey: .time)
        self.price = try container.decode(Int.self, forKey: .price)
        self.image = try container.decode(String.self, forKey: .image)
        self.video = try container.decode(String.self, forKey: .video)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(desc, forKey: .desc)
        try container.encode(ingridients, forKey: .ingridients)
        try container.encode(steps, forKey: .steps)
        try container.encode(time, forKey: .time)
        try container.encode(price, forKey: .price)
        try container.encode(image, forKey: .image)
        try container.encode(video, forKey: .video)
    }
}
