//
//  DeckListView.swift
//  CutKost
//
//  Created by Lucky on 31/03/24.
//

import Foundation
import SwiftUI
import SwiftData

struct DeckListView: View {
    
    @Environment(\.modelContext) private var context
    
    let decksItem: DeckModel
    let recipesItem: [RecipeModel]
    
    @Query private var deck: [DeckModel]
    
    var body: some View {
        VStack {
            
            Text("\(decksItem.price)")
            
            ForEach(decksItem.recipes, id: \.self) { item in
                if let recipe = recipesItem.first(where: { $0.id == item }) {
                    URLImageView(url: recipe.image)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                    
                    Text(recipe.name)
                    
                    Text("\(recipe.price)")
                    
                    Spacer()
                }
            }
            
            
            Button(action: {
                context.delete(decksItem)
                
                print("Deck Deleted!")
                
            }) {
                Text("Delete Deck")
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
