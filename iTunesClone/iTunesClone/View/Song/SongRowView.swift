//
//  SongRowView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct SongRowView: View {

  let song: Song

  var body: some View {
    HStack {

      ImageLoadingView(urlString: song.artworkUrl60, width: 60, height: 60)

      VStack(alignment: .leading, spacing: 6) {

        Text(song.trackName)
          .font(.subheadline)
          .lineLimit(1)

        Text(song.artistName + " - " + song.collectionName)
          .font(.caption2)
          .foregroundStyle(.gray)
          .multilineTextAlignment(.leading)
          .lineLimit(2)

      }

      Spacer(minLength: 20)

      BuySongButtonView(urlString: song.trackViewURL,
                        price: song.trackPrice,
                        currency: song.currency)
    }
  }
}

#Preview {
  SongRowView(song: Song.example())
}
