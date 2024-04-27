//
//  AlbumDetailView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct AlbumDetailView: View {

  @StateObject var viewModel: AlbumDetailSongListViewModel

  let album: Album

  init(album: Album) {
    self.album = album
    self._viewModel = StateObject(wrappedValue: AlbumDetailSongListViewModel(albumID: album.id))
  }

  var body: some View {
    
    VStack {

      AlbumHeaderView(album: album)

      AlbumDetailSongListView(viewModel: viewModel, selectedSong: nil)
    }
    // make expensive API calls in onAppear to be more efficient and get only the data that you need and don't do it in the initialiser
    .onAppear {
      viewModel.fetch()
    }
    .navigationTitle(album.collectionName)
    .navigationBarTitleDisplayMode(.inline)

  }

}

#Preview {
  AlbumDetailView(album: Album.example())
}
