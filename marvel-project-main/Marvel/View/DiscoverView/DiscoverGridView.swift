//
//  DiscoverCharactersGridView.swift
//  Marvel
//
//  Created by Clara Muniz on 19/10/23.
//

import SwiftUI

struct DiscoverCharactersGridView: View {
    let characters: [Character]    
    let columns = [
        GridItem(.flexible(minimum: 130, maximum: 1300)),
        GridItem(.flexible(minimum: 130, maximum: 1300))
    ]
    
    @Binding var didTapDetailsCell: Bool
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(characters) { character in
                NavigationLink(destination: DetailsView(character: character, didTapDetailsCell: $didTapDetailsCell)) {
                    DiscoverCharactersCell(character: character)
                        .padding(EdgeInsets(top: 2, leading: 1, bottom: 2, trailing: 1))
                }
            }
        }
        .onAppear() {
            didTapDetailsCell = false
        }
    }
}

#Preview {
    ContentView()
}
