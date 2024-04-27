//
//  AlbumListView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct AlbumListView: View {

  @ObservedObject var viewModel: AlbumListViewModel

  var body: some View {

    List {

      ForEach (viewModel.albums) { album in

        // old way using Navigation View
//        NavigationLink {
//          AlbumDetailView(album: album)
//        } label: {
//          AlbumRowView(album: album)
//        }

        // new way using NavigationStack
        NavigationLink(value: album) {
          AlbumRowView(album: album)
        }

      }

      switch viewModel.state {
      case .start:
        Color.clear
          .onAppear {
            viewModel.loadMore()
          }
      case .isLoading:
        ProgressView()
          .progressViewStyle(.circular)
          .frame(maxWidth: .infinity)
      case .loadedAll:
        EmptyView()
      case .error(let message):
        Text(message)
          .foregroundStyle(.red)
      }

    }
    .listStyle(.plain)
    .navigationDestination(for: Album.self) { album in
      AlbumDetailView(album: album)
    }

  }
}

#Preview {
  NavigationView {
    AlbumListView(viewModel: AlbumListViewModel.example())
  }
}
