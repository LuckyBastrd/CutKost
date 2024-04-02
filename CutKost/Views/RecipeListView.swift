//
//  RecipeListView.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import SwiftUI
import SwiftData

struct RecipeListView: View {
    
    let item: RecipeModel
    
    let maxPrice: Int
    @State private var isAddedToDeck = false
    
    @ObservedObject var deckViewModel: DeckViewModel
    
    var body: some View {
        HStack{
            URLImageView(url: item.image)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            Text(item.name)
            Text("\(item.price)")
            Spacer()
            
            Button(action: {
                deckViewModel.addToDeck(recipeID: item.id)
            }) {
                Text(isAddedToDeck ? "Added" : "Add to Deck")
            }
        }
    }
}
