//
//  ContentView.swift
//  Marvel
//
//  Created by Clara Muniz on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var discoverViewModel = DiscoverViewModel()
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem(label: "Discover", systemImage: "square.grid.2x2")
                .environmentObject(discoverViewModel)
            
            FavoritesView()
                .tabItem(label: "Favorites", systemImage: "star")
        }
        .tint(Color.white)
    }
}

#Preview {
    ContentView()
}
