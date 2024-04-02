//
//  DeckViewModel.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftData

class DeckViewModel: ObservableObject {
    
    @Published var tempRecipesId: [String] = []
    
    func addToDeck(recipeID: String) {
        
        if tempRecipesId.count < 3 {
            
            tempRecipesId.append(recipeID)
            
            //print("Deck is not full yet!")
            
            return
        }
        
        return
    }
    
    func deleteFromDeck(recipeID: String) {
        if let index = tempRecipesId.firstIndex(of: recipeID) {
            
            tempRecipesId.remove(at: index)
            
            return
        }
        
        return
    }
    
    func getTempRecipesId() -> [String] {
        return tempRecipesId
    }
    
    func clearTempRecipesId() {
        tempRecipesId = []
    }
}
