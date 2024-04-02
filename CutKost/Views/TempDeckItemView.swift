//
//  TempDeckItemView.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftUI

struct TempDeckItemView: View {
    
    let item: RecipeModel
    let uniqueID: String
    @State var price: Int
    
    @ObservedObject var deckViewModel: DeckViewModel
    
    @State private var isDeleteToDeck = false
    
    var body: some View {
        
        Text("\(price)")
        
        HStack {
            // Display recipe image
            URLImageView(url: item.image)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            // Display recipe name
            Text(item.name)
            
            Spacer()
            
            // Button to delete recipe
            Button(action: {
                deckViewModel.deleteFromDeck(recipeID: item.id)
            }) {
                Text(isDeleteToDeck ? "Deleted" : "Delete Item")
            }
        }
        // Ensure each view has a unique identifier
        .id(uniqueID)
    }
}
