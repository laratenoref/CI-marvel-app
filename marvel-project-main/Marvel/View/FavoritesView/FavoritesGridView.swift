//
//  FavoritesGridView.swift
//  Marvel
//
//  Created by Clara Muniz on 21/11/23.
//

import SwiftUI

struct FavoritesGridView: View {
    let characters: [CharacterFavorite]
    
    @Binding var didTapDetailsCell: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(characters) { characterFavorite in
                NavigationLink(destination: DetailsView(character: characterFavorite.convertToCharacter(), didTapDetailsCell: $didTapDetailsCell)) {
                    FavoriteCharacterCell(character: characterFavorite)
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
