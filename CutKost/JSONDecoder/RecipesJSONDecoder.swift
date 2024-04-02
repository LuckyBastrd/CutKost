//
//  RecipesJSONDecoder.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftData

struct RecipesResponse: Codable {
    let name: String
    let desc: String
    let ingridients: [String]
    let steps: [String]
    let time: Int
    let price: Int
    let image: String
    let video: String
}

struct RecipesJSONDecoder {

//    static func decode(from fileName: String) -> [RecipesResponse] {
//        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
//              let data = try? Data(contentsOf: url),
//              let recipes = try? JSONDecoder().decode([RecipesResponse].self, from: data)  else {
//            return []
//        }
//        
//        return recipes
//    }
    
    static func decode(from fileName: String) -> [RecipesResponse] {
        // Log: Start decoding process
        print("Decoding from file:", fileName)

        // Attempt to create URL for the JSON file
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            // Log: Unable to find file
            print("Error: Unable to find JSON file named", fileName)
            return []
        }
        // Log: URL created successfully
        print("URL for JSON file:", url)

        // Attempt to load data from the URL
        do {
            let data = try Data(contentsOf: url)
            // Log: Data loaded successfully
            print("Data loaded successfully")

            // Attempt to decode JSON data into array of RecipesResponse
            do {
                let recipes = try JSONDecoder().decode([RecipesResponse].self, from: data)
                // Log: Decoding successful
                print("Decoding successful")
                return recipes
            } catch {
                // Log: Decoding error
                print("Error decoding JSON:", error)
                return []
            }
        } catch {
            // Log: Unable to load data from URL
            print("Error loading data from URL:", error)
            return []
        }
    }
}
