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
    @State var searchField: String = ""
    @State var inputPrice: String = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("search menu").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                TextField("Search here...", text: $searchField)
                                    .padding(.horizontal)
                                    .frame(height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(15).shadow(radius: 0.7).padding(.horizontal, 13)
                if !searchField.isEmpty {
                    let filteredRecipes = recipes.filter { recipe in
                        return recipe.name.range(of: searchField, options: .caseInsensitive) != nil
                    }
                    
                    if filteredRecipes.isEmpty {
                        Text("search tidak ditemukan")
                    } else {
                        ForEach(filteredRecipes) { recipe in
                            RecipeListView(item: recipe, maxPrice: 0, deckViewModel: deckViewModel)
                        }
                    }
                }
                
                Spacer().frame(height: 70)
                
                Text("daftar menu").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                TextField("Input your budget...", text: $inputPrice)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(15).shadow(radius: 0.7).padding(.horizontal, 13)
                if inputPrice.isEmpty {
                    Text("kosong")
                } else {
                    let maxPrice = Int(inputPrice) ?? 0
                    let filteredRecipes = recipes.filter { $0.price <= maxPrice }
                    let highestPrice = filteredRecipes.sorted { $0.price > $1.price }
                    
                    ForEach(highestPrice) { recipe in
                        RecipeListView(item: recipe, maxPrice: maxPrice, deckViewModel: deckViewModel)
                    }
                }
                
                Spacer().frame(height: 70)
                
                Text("temporary deck").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if deckViewModel.getTempRecipesId().isEmpty {
                    Text("kosong")
                } else {
                    ForEach(recipes) { recipe in
//                        TempDeckListView(item: recipe, deckViewModel: deckViewModel)
                        TempDeckListView(item: recipe, price: Int(inputPrice) ?? 0, deckViewModel: deckViewModel)
                    }
                }
                
                Spacer().frame(height: 70)
                
                if deckViewModel.getTempRecipesId().count == 3 {
                    NewDeckView(deckViewModel: deckViewModel, price: Int(inputPrice) ?? 0)
                }
                
                Text("saved deck").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if decks.isEmpty {
                    Text("No Decks Saved")
                } else {
                    ForEach(decks) { deck in
                        DeckListView(decksItem: deck, recipesItem: recipes)
                    }
                }
                
                Spacer().frame(height: 70)
                
                NavigationLink(destination: ExploreView(recipes: recipes)){
                    Text("Explore View").padding(.horizontal, 50).padding(.vertical, 7).foregroundColor(.orange).fontWeight(.semibold)
                        .background(
                            .white
                        ).cornerRadius(20)
                }.padding(.top, 100)
            }
            .padding()
        }
    }
}
