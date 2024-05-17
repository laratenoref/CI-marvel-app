//
//  TopComponent.swift
//  Marvel
//
//  Created by Clara Muniz on 17/10/23.
//

import SwiftUI

struct SearchComponent: View {
    @Binding var isSearching: Bool
    @Binding var nameStartsWith: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 56)
                .foregroundColor(mRed)
            
            VStack {
                if isSearching {
                    TextField("", text: $nameStartsWith, prompt: Text("Type to start searching").foregroundStyle(Color.white))
                        .foregroundStyle(Color.white)
                        .accentColor(.white)
                        .padding([.leading, .trailing], 30)
                        .accessibilityIdentifier("SearchTextField")
                } else {
                    Image("marvel_logo")
                }
            }
            .animation(.easeInOut, value: isSearching)

            HStack {
                Spacer()
                Button {
                    isSearching.toggle()
                    if isSearching == false {
                        nameStartsWith = ""
                    }
                } label: {
                    Image(systemName: isSearching ? "xmark" : "magnifyingglass")
                        .padding(.trailing, 10)
                }
            }
            .padding()
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    SearchComponent(isSearching: .constant(false), nameStartsWith: .constant("n"))
}
