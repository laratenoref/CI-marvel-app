//
//  DetailsCell.swift
//  Marvel
//
//  Created by Clara Muniz on 16/11/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import SwiftData

struct DetailsCell: View {
    var character: Character
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var isFavorite = false
    @State var storage = Storage()
    
    var body: some View {
        ZStack {
            AsyncImage(url: character.thumbnail?.extractImage) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 430, height: 319)
                        .clipped()
                } else if phase.error != nil {
                    Image(systemName: "rectangle.slash.fill")
                        .resizable()
                        .frame(width: 430, height: 319)
                } else {
                    ProgressView()
                        .frame(width: 430, height: 319)
                }
            }
            
            Shadow()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .padding(.leading, 30)
                    }
                    
                    Spacer()
                    
                    Button {
                        storage.updateFavoritesList(character, using: modelContext)
                        isFavorite = storage.isFavorite(character, modelContext: modelContext)
                    } label: {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .font(.system(size: 24))
                            .padding(.trailing, 30)
                    }
                }
                .foregroundStyle(Color.white)
                .padding(.bottom, 220)
                
                HStack {
                    Text("\(character.name)")
                        .font(.custom("Roboto Medium", size: 28))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                .padding(.leading, 30)
            }
        }
        .onAppear() {
            isFavorite = storage.isFavorite(character, modelContext: modelContext)
        }
    }
}

#Preview {
    DetailsView(character: Character(id: 930219, name: "Clara", thumbnail: CharacterImage(path: nil, ext: nil), urls: []), didTapDetailsCell: .constant(true))
}
