//
//  Details Screen.swift
//  Marvel
//
//  Created by Clara Muniz on 16/11/23.
//

import SwiftUI

struct DetailsView: View {
    var character: Character
    @Binding var didTapDetailsCell: Bool
    
    var body: some View {
        ZStack {
            Image("app_background")
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            VStack {
                DetailsCell(character: character)
                
                ScrollView {
                    VStack {
                        if let description = character.description, description.isEmpty == false {
                            Text(description)
                                .padding(.horizontal, 30)
                        } else {
                            Text("No description available")
                        }
                    }
                    .font(.custom("Roboto Regular", size: 18))
                    .foregroundStyle(.white)
                }
            }
        }
        .onAppear() {
            didTapDetailsCell = true
        }
        .background(mRed)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
