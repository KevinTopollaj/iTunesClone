//
//  MovieRowView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct MovieRowView: View {

  let movie: Movie

  var body: some View {

    HStack {

      ImageLoadingView(urlString: movie.artworkUrl100, width: 60, height: 100)

      VStack(alignment: .leading, spacing: 6) {
        Text(movie.trackName)
          .font(.body)
          .lineLimit(2)

        Text(movie.primaryGenreName)
          .font(.caption)
          .foregroundStyle(.gray)

        Text(movie.releaseDate)
          .font(.caption)
      }

      Spacer(minLength: 20)

      BuyButtonView(urlString: movie.previewURL ?? "",
                    price: movie.trackPrice,
                    currency: movie.currency)

    }

  }
}

#Preview {
  MovieRowView(movie: Movie.example())
}
