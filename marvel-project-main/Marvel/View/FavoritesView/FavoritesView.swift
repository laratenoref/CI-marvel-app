//
//  FavoritesView.swift
//  Marvel
//
//  Created by Clara Muniz on 21/11/23.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var characterFavorite: [CharacterFavorite]
    
    @State var isSearching = false
    @State var nameStartsWith = ""
    @State private var didTapDetailsCell = false
    
    var filteredCharacter: [CharacterFavorite] {
        if nameStartsWith.isEmpty {
            return characterFavorite
        }
        
        let filteredCharacter = characterFavorite.compactMap { character in
            let nameContains = character.name.range(of: nameStartsWith, options: .caseInsensitive) != nil
            return nameContains ? character : nil
        }
        
        return filteredCharacter
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if didTapDetailsCell == false {
                SearchComponent(isSearching: $isSearching, nameStartsWith: $nameStartsWith)
                    .background(mRed)
            }
            
            NavigationStack {
                ZStack {
                    Image("app_background")
                        .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .ignoresSafeArea(edges: .horizontal)
                    
                    if characterFavorite.isEmpty {
                        Text("No favorites saved!")
                            .font(.custom("Komika Hand Italic", size: 13))
                            .foregroundStyle(Color.white)
                        
                    } else {
                        ScrollView {
                            FavoritesGridView(characters: filteredCharacter, didTapDetailsCell: $didTapDetailsCell)
                        }
                        .padding(.bottom, 5)
                        .onAppear() {
                            didTapDetailsCell = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
