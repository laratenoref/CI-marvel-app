//
//  CharacterCell.swift
//  Marvel
//
//  Created by Clara Muniz on 13/10/23.
//

import SwiftUI
import SwiftData

struct DiscoverCharactersCell: View {
    var character: Character
    
    @Environment(\.modelContext) private var modelContext
    
    @State var isFavorite = false
    @State var storage = Storage()
    
    var body: some View {
        ZStack {
            //Error to load the images. Sometimes, an image tries to load before the character has a valid URL
            AsyncImage(url: character.thumbnail?.extractImage) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 233)
                        .clipped()
                } else if phase.error != nil {
                    Image(systemName: "rectangle.slash.fill")
                        .resizable()
                        .frame(width: 170, height: 233)
                } else {
                    ProgressView()
                        .frame(width: 412, height: 319)
                }
            }
            Button {
                storage.updateFavoritesList(character, using: modelContext)
                isFavorite = storage.isFavorite(character, modelContext: modelContext)
            } label: {
                Image(isFavorite ? "checked" : "unchecked")
            }
            .padding(EdgeInsets(top: 5, leading: 120, bottom: 190, trailing: 0))
            
            Group{
                Image("backgroundDiscover")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
                
                Text(character.name)
                    .font(.custom("Komika Hand Italic", size: 13))
                    .padding()
                    .foregroundStyle(Color.black)
            }
            .padding(EdgeInsets(top: 167, leading: 0, bottom: 0, trailing: 0))
            
        }
        .frame(width: 170, height: 233)
        .overlay(
            Rectangle()
                .stroke(lineWidth: 3.1)
                .frame(width: 167, height: 230)
                .foregroundStyle(Color.black)
        )
        .onAppear() {
            isFavorite = storage.isFavorite(character, modelContext: modelContext)
        }
    }
}

#Preview {
    ContentView()
}
