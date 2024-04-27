//
//  SearchView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct SearchView: View {

  @State private var searchTerm = ""
  @State private var selectedEntityType = EntityType.all

  @StateObject private var albumListViewModel = AlbumListViewModel()
  @StateObject private var songListViewModel = SongListViewModel()
  @StateObject private var movieListViewModel = MovieListViewModel()

  var body: some View {

    NavigationStack {
      VStack {
        Picker("Select media type", selection: $selectedEntityType) {

          ForEach(EntityType.allCases) { type in
            Text(type.name)
              .tag(type)
          }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)

        Divider()

        if searchTerm.isEmpty {

          SearchPlaceholderView(searchTerm: $searchTerm)
            .frame(maxHeight: .infinity)

        } else {

          switch selectedEntityType {
          case .all:

            SearchAllListView(albumListViewModel: albumListViewModel,
                              songListViewModel: songListViewModel,
                              movieListViewModel: movieListViewModel)

          case .album:

            AlbumListView(viewModel: albumListViewModel)

          case .song:

            SongListView(viewModel: songListViewModel)

          case .movie:

            MovieListView(viewModel: movieListViewModel)

          }
        }


      }
      .searchable(text: $searchTerm)
      .navigationTitle("Search")
      .navigationBarTitleDisplayMode(.inline)
    }
    .onChange(of: selectedEntityType) { _, newValue in

      updateViewModels(for: searchTerm, selectedEntityType: newValue)

    }
    .onChange(of: searchTerm) { _, newValue in

      updateViewModels(for: newValue, selectedEntityType: selectedEntityType)

    }

  }


  func updateViewModels(for searchTerm: String,
                        selectedEntityType: EntityType) {

    switch selectedEntityType {
    case .all:
      albumListViewModel.searchTerm = searchTerm
      songListViewModel.searchTerm = searchTerm
      movieListViewModel.searchTerm = searchTerm

    case .album:
      albumListViewModel.searchTerm = searchTerm
      songListViewModel.searchTerm = ""
      movieListViewModel.searchTerm = ""

    case .song:
      albumListViewModel.searchTerm = ""
      songListViewModel.searchTerm = searchTerm
      movieListViewModel.searchTerm = ""

    case .movie:
      albumListViewModel.searchTerm = ""
      songListViewModel.searchTerm = ""
      movieListViewModel.searchTerm = searchTerm

    }

  }

}

#Preview {
  SearchView()
}
