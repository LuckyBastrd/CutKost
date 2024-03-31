//
//  DeckListView.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftUI
import SwiftData

struct TempDeckListView: View {
    
    let item: RecipeModel
    
    @State private var isDeleteToDeck = false
    @ObservedObject var deckViewModel: DeckViewModel
    
    var body: some View {
        HStack{
            ForEach(deckViewModel.tempRecipesId, id: \.self) { recipeID in
                if item.id == recipeID {
                    
                    URLImageView(url: item.image)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                    
                    Text(item.name)
                    
                    Spacer()
                    
                    Button(action: {
                        deckViewModel.deleteFromDeck(recipeID: item.id)
                    }) {
                        Text(isDeleteToDeck ? "Deleted" : "Delete Item")
                    }
                }
            }
        }
    }
}
