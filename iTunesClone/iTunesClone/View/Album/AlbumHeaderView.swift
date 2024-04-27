//
//  AlbumHeaderView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct AlbumHeaderView: View {

  let album: Album

  var body: some View {

    HStack {

      ImageLoadingView(urlString: album.artworkUrl100, width: 100, height: 100)

      VStack(alignment: .leading, spacing: 20) {

        VStack(alignment: .leading, spacing: 2){
          Text(album.collectionName)
            .font(.subheadline)
            .lineLimit(1)

          Text(album.artistName)
            .font(.caption)
            .foregroundStyle(.gray)
            .multilineTextAlignment(.leading)
        }

        HStack(alignment: .bottom) {

          VStack(alignment: .leading, spacing: 0) {
            Text(album.primaryGenreName)

            Text("\(album.trackCount) songs")

            Text("Released: \(formattedDate(value: album.releaseDate))")

          }
          .font(.caption)
          .lineLimit(1)
          .foregroundStyle(.gray)

          Spacer(minLength: 20)

          BuyButtonView(urlString: album.collectionViewURL,
                        price: album.collectionPrice,
                        currency: album.currency)
        }
      }

    }
    .padding()
    .background(Color(.systemBackground)
                  .ignoresSafeArea(edges: .top)
                  .shadow(radius: 5))

  }

  func formattedDate(value: String) -> String {

    let dateFormatterGetter = DateFormatter()
    dateFormatterGetter.dateFormat = "yyyy-MM-dd'T'HH-mm-ss'Z'"

    guard let date = dateFormatterGetter.date(from: value) else {
      return ""
    }

    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none

    return dateFormatter.string(from: date)
  }

}

#Preview {
  AlbumHeaderView(album: Album.example())
}
