//
//  HomePage.swift
//  Marvel
//
//  Created by Clara Muniz on 13/10/23.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject var discoverViewModel: DiscoverViewModel
    
    @State var isSearching = false
    @State var nameStartsWith = ""
    @State var sorting = true
    @State private var didTapDetailsCell = false
    @State private var task: Task <Void, Never>?
    @State private var showingProgressView = true
    
    var body: some View {
        VStack(spacing: 0) {
            if didTapDetailsCell == false {
                SearchComponent(isSearching: $isSearching, nameStartsWith: $nameStartsWith)
                    .background(mRed)
                
                SortingComponent(sorting: $sorting)
            }
            
            NavigationStack {
                ZStack {
                    Image("app_background")
                        .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .ignoresSafeArea(edges: .horizontal)
                    
                    switch discoverViewModel.state {
                    case .started, .isLoading :
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            .controlSize(.large)
                        
                        
                    case .requestSucceeded:
                        ScrollView {
                            VStack {
                                DiscoverCharactersGridView(characters: discoverViewModel.someCharacters, didTapDetailsCell: $didTapDetailsCell)
                                    .padding()
                                    .safeAreaInset(edge: .bottom, alignment: .center) {
                                        if discoverViewModel.shouldLoadMoreCharacters && showingProgressView {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                                                .controlSize(.large)
                                                .onAppear {
                                                    Task {
                                                        try await Task.sleep(for: .seconds(5))
                                                        showingProgressView = false
                                                    }
                                                }
                                        }
                                    }
                                
                                GeometryReader { reader -> Color in
                                    let minY = reader.frame (in: .global) .minY
                                    let height = UIScreen.main.bounds.height / 0.7
                                    if minY < height && discoverViewModel.shouldLoadMoreCharacters == true {
                                        Task {
                                            await discoverViewModel.loadMoreCharacters(nameStartsWith: nameStartsWith, sorting: sorting)
                                        }
                                    }
                                    return Color.clear
                                }
                            }
                        }
                        
                    case .requestFailed:
                        Text("No results found!")
                            .font(.custom("Komika Hand Italic", size: 13))
                            .foregroundStyle(Color.white)
                    }
                }
                .onAppear() {
                    if discoverViewModel.someCharacters.isEmpty {
                        Task(priority: .high) {
                            await discoverViewModel.loadInitialCharacters()
                        }
                    }
                }
                .onChange(of: nameStartsWith) { _, newValue in
                    task?.cancel()
                    task = Task {
                        do {
                            try await Task.sleep(for: .seconds(1))
                            if !newValue.isEmpty {
                                discoverViewModel.shouldLoadMoreCharacters = false
                            } else {
                                discoverViewModel.shouldLoadMoreCharacters = true
                            }
                            await discoverViewModel.loadInitialCharacters(nameStartsWith: newValue, sorting: sorting)
                        } catch {}
                    }
                }
                .onChange(of: sorting) { _, newValue in
                    Task(priority: .userInitiated) {
                        await discoverViewModel.loadInitialCharacters(nameStartsWith: nameStartsWith, sorting: newValue)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
