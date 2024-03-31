//
//  CutKostApp.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import SwiftUI
import SwiftData

@main
struct CutKostApp: App {
    
    let container: ModelContainer
    let recipeViewModel: RecipeViewModel
    
    init() {
        let schema = Schema([RecipeModel.self, DeckModel.self])
         do {
             container = try ModelContainer(for: schema)
         } catch {
             fatalError("Could not configure the container")
         }
        
        recipeViewModel = RecipeViewModel(modelContext: container.mainContext)
        recipeViewModel.preloadRecipes()
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
     }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(container)
    }
}
