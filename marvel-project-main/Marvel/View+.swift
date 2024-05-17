//
//  View+.swift
//  Marvel
//
//  Created by Clara Muniz on 01/12/23.
//

import SwiftUI

extension View {
    func tabItem(label: String, systemImage: String) -> some View {
        return self
            .modifier(TabItemLabelModifier(label: label, systemImage: systemImage))
    }
    
    func overlayImage(name: String) -> some View {
        return self
            .modifier(OverlayImage(name: name))
    }
}

// MARK: - View Modifiers
private struct TabItemLabelModifier: ViewModifier {
    let label: String
    let systemImage: String
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                Label("\(label)", systemImage: "\(systemImage)")
                    .environment(\.symbolVariants, .none)
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
    }
}

private struct OverlayImage: ViewModifier {
    var name: String
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                Group{
                    Image("backgroundFavorites")
                        .resizable()
                        .frame(maxWidth: 380, maxHeight: 61)
                    
                    Text(name)
                        .font(.custom("Komika Hand Italic", size: 13))
                        .padding()
                        .foregroundStyle(Color.black)
                }
            }
            .overlay(
                Rectangle()
                    .stroke(lineWidth: 3.1)
                    .frame(maxWidth: 380, maxHeight: 204)
                    .foregroundStyle(Color.black)
            )
    }
}

