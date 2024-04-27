//
//  AlbumRowView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct AlbumRowView: View {

  let album: Album

  var body: some View {
    HStack {

      ImageLoadingView(urlString: album.artworkUrl100, width: 100, height: 100)

      VStack(alignment: .leading, spacing: 6) {
        Text(album.collectionName)
          .lineLimit(2)
        Text(album.artistName)
          .font(.caption)
          .foregroundStyle(.gray)
          .multilineTextAlignment(.leading)
      }

      Spacer(minLength: 20)


      BuyButtonView(urlString: album.collectionViewURL,
                    price: album.collectionPrice,
                    currency: album.currency)

    }
  }
}

#Preview {
  AlbumRowView(album: Album.example())
}
