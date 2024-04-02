//
//  DeleteDeckView.swift
//  CutKost
//
//  Created by Lucky on 01/04/24.
//

import Foundation
import SwiftUI
import SwiftData

struct DeleteDeckView: View {
    
    @Environment(\.modelContext) private var context
    @ObservedObject var deckViewModel: DeckViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                
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
