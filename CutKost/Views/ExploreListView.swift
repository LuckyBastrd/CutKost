//
//  ExploreListView.swift
//  CutKost
//
//  Created by Lucky on 01/04/24.
//

import Foundation
import SwiftUI

struct ExploreListView: View {
    
    let item: RecipeModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 162.26, height: 197.98)
                .cornerRadius(9.17)
                .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
            
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 162.26, height: 118.38)
                    .background(
                        Image("TumisUdang")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 162.26, height: 118.38)
                            .clipped()
                    )
                    .cornerRadius(9.17)
                    .shadow(color: .black.opacity(0.15), radius: 2.29185, x: 0, y: 2.75022)
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                HStack(spacing: 0) {
                    Text(item.name)
                        .font(
                          Font.custom("Inter", size: 13.75)
                            .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                        .frame(width: 97.97, height: 18.37, alignment: .leading)
                        .padding(.leading, 13.27).padding(.trailing, 16.33)

                    // Bookmark Button
                    Image(systemName: "bookmark")
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 11.23)
                }
                .padding(.bottom, 7.14)
                    
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 46.53, height: 14.7)
                            .background(Color(red: 0.97, green: 0.47, blue: 0.18))
                            .cornerRadius(2.75)
                        
//                        Text("Rp 35.000")
                        Text("Rp \(item.price)")
                            .font(
                              Font.custom("Inter", size: 6.6)
                                .weight(.semibold)
                            )
                            .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                            .frame(width: 33, height: 9.17, alignment: .center)
                    }
                    .padding(.trailing, 5.51)

//                    Text("15 Menit")
                    Text("\(item.time) Menit")
                        .font(
                          Font.custom("Inter", size: 6.60056)
                            .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.97, green: 0.47, blue: 0.18))
                        .frame(width: 30.62, height: 9.18, alignment: .topLeading)
                }
                .padding(.bottom, 21.02).padding(.leading, 13.27).padding(.trailing, 66.33)
            }
        }
    }
}
