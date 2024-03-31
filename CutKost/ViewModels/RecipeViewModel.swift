//
//  RecipeViewModel.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftData


class RecipeViewModel: ObservableObject {
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func preloadRecipes() {
//        do {
//            try modelContext.delete(model: RecipeModel.self)
//        } catch {
//            print("Failed to clear all recipes data.")
//        }
        
        //Check we haven't already added our recipes.
        let descriptor = FetchDescriptor<RecipeModel>()
        let existingRecipes = try? modelContext.fetchCount(descriptor)
        guard existingRecipes == 0 else { return }
        
        let recipes = RecipesJSONDecoder.decode(from: "Recipes")
        if !recipes.isEmpty {
            recipes.forEach { item in
                let recipe = RecipeModel(
                    name: item.name,
                    desc: item.desc,
                    ingridients: item.ingridients,
                    steps: item.steps,
                    time: item.time,
                    price: item.price,
                    image: item.image,
                    video: item.video
                )
                
                modelContext.insert(recipe)
            }
        }
    }
    

}
