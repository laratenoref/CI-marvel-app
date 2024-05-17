//
//  SortingComponent.swift
//  Marvel
//
//  Created by Clara Muniz on 07/11/23.
//

import SwiftUI

struct SortingComponent: View {
    @Binding var sorting: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 56)
                .foregroundColor(mBlack)
            
            HStack {
                Text("Ordering by name")
                    .kerning(0.5)
                
                Image(systemName: sorting ? "arrow.down" : "arrow.up")
                
                Spacer()
            }
            .padding(.leading, 22)
            .foregroundStyle(.white)
            .font(.custom("Roboto Regular", size: 16))
            
            HStack {
                Spacer()
                Button {
                    sorting.toggle()
                } label: {
                    Text("Change")
                        .font(.custom("Roboto Medium", size: 16))
                        .foregroundStyle(.white)
                }
            }
            .padding(.trailing, 28)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SortingComponent(sorting: .constant(true))
}
