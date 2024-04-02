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
    @State var price: Int
    @ObservedObject var deckViewModel: DeckViewModel
    
    var body: some View {
        // Iterate over indices of filtered IDs
        ForEach(deckViewModel.tempRecipesId.indices.filter { deckViewModel.tempRecipesId[$0] == item.id }, id: \.self) { index in
            // Use index as part of the unique identifier
            let uniqueID = "\(item.id)-\(index)"
            //TempDeckItemView(item: item, uniqueID: uniqueID, deckViewModel: deckViewModel)
            TempDeckItemView(item: item, uniqueID: uniqueID, price: price, deckViewModel: deckViewModel)
        }
    }
}
