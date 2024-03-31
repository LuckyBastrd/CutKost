//
//  ContentView.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Query var recipes: [RecipeModel]
    @Query var decks: [DeckModel]
    
    @StateObject var deckViewModel = DeckViewModel()

    var body: some View {
        ScrollView {
            VStack {
                Text("daftar menu").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if recipes.isEmpty {
                    Text("kosong")
                } else {
                    ForEach(recipes) { recipe in
                        RecipeListView(item: recipe, deckViewModel: deckViewModel)
                    }
                }
                
                Text("temporary deck").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if deckViewModel.getTempRecipesId().isEmpty {
                    Text("kosong")
                } else {
                    ForEach(recipes) { recipe in
                        TempDeckListView(item: recipe, deckViewModel: deckViewModel)
                    }
                }
                
                if deckViewModel.getTempRecipesId().count == 3 {
                    NewDeckView(deckViewModel: deckViewModel, price: 66000)
                }
                
                Text("saved deck").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if decks.isEmpty {
                    Text("No Decks Saved")
                } else {
                    ForEach(decks) { deck in
                        DeckListView(decksItem: deck, recipesItem: recipes)
                    }
                }

            }
            .padding()
        }
    }
}
