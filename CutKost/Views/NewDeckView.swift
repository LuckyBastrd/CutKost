//
//  NewDeckView.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftUI
import SwiftData

struct NewDeckView: View {
    
    @Environment(\.modelContext) private var context
    @ObservedObject var deckViewModel: DeckViewModel
    
    @State var price: Int
    
    var body: some View {
        VStack {
            Button(action: {
                let deck = DeckModel(price: price, isSave: true, recipes: deckViewModel.getTempRecipesId())
                
                print(deckViewModel.getTempRecipesId())
                
                context.insert(deck)
                
                print("Saved!")
                
                deckViewModel.clearTempRecipesId()
            }) {
                Text("Save")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom)
            }
            .padding()
            .padding(.horizontal)
        }
    }
}
