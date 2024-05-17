//
//  FavoriteCharacterCell.swift
//  Marvel
//
//  Created by Clara Muniz on 21/11/23.
//

import SwiftUI

struct FavoriteCharacterCell: View {
    var character: CharacterFavorite
    
    @State var favorite = false
    
    var body: some View {
        AsyncImage(url: character.thumbnail?.extractImage) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 380, maxHeight: 204)
                    .clipped()
                    .overlayImage(name: character.name)
                
            } else if phase.error != nil {
                Image(systemName: "rectangle.slash.fill")
                    .resizable()
                    .frame(maxWidth: 380, maxHeight: 204)
                    .overlayImage(name: character.name)
            } else {
                ProgressView()
                    .frame(maxWidth: 380, maxHeight: 204)
            }
        }
    }
}

#Preview {
    ContentView()
}
