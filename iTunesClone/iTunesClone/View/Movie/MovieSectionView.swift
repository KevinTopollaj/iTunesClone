//
//  MovieSectionView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct MovieSectionView: View {

  let movies: [Movie]

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {

      LazyHStack(alignment: .top) {

        ForEach(movies) { movie in

          VStack(alignment: .leading) {

            ImageLoadingView(urlString: movie.artworkUrl100, width: 80, height: 100)

            Text(movie.trackName)
              .font(.subheadline)
              .lineLimit(2)

            Text(movie.primaryGenreName)
              .font(.caption2)
              .foregroundStyle(.gray)
              .lineLimit(1)
          }
          .frame(width: 80)

        }
      }
      .padding([.horizontal])

    }

  }
}

#Preview {
  MovieSectionView(movies: [Movie.example()])
}
