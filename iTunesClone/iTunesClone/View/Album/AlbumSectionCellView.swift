//
//  AlbumSectionCellView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct AlbumSectionCellView: View {

  let album: Album

  var body: some View {

    VStack(alignment: .leading) {

      ImageLoadingView(urlString: album.artworkUrl100, width: 100, height: 100)

      Text(album.collectionName)
        .font(.subheadline)
        .lineLimit(2)

      Text(album.artistName)
        .font(.caption2)
        .foregroundStyle(.gray)
        .lineLimit(1)
    }
    .frame(width: 100)
    
  }
}

#Preview {
  AlbumSectionCellView(album: Album.example())
}
