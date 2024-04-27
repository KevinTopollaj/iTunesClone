//
//  SearchAllListView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct SearchAllListView: View {

  @ObservedObject var albumListViewModel: AlbumListViewModel
  @ObservedObject var songListViewModel: SongListViewModel
  @ObservedObject var movieListViewModel: MovieListViewModel

  var body: some View {
    ScrollView {
      LazyVStack {

        sectionHeaderWith(title: "Songs", 
                          destination: SongListView(viewModel: songListViewModel))

        SongsSectionView(songs: songListViewModel.songs)

        Divider()
          .padding(.bottom, 5)

        sectionHeaderWith(title: "Albums",
                          destination: AlbumListView(viewModel: albumListViewModel))

        AlbumSectionView(albums: albumListViewModel.albums)

        Divider()
          .padding(.bottom, 5)

        sectionHeaderWith(title: "Movies",
                          destination: MovieListView(viewModel: movieListViewModel))

        MovieSectionView(movies: movieListViewModel.movies)

      }
    }
  }

  private func sectionHeaderWith(title: String, destination: some View) -> some View {

    HStack {
      titleOfSection(title)

      Spacer()

      NavigationLink {
        destination
      } label: {
        seeAllView
      }

    }
    .padding(.horizontal)

  }

  private func titleOfSection(_ title: String) -> some View {
    Text(title)
      .font(.body)
  }

  private var seeAllView: some View {
    HStack{
      Text("See all")
      Image(systemName: "chevron.right")
    }
    .font(.subheadline)
    .foregroundStyle(.gray)
  }

}

#Preview {
  SearchAllListView(albumListViewModel: AlbumListViewModel.example(), songListViewModel: SongListViewModel.example(), movieListViewModel: MovieListViewModel.example())
}
