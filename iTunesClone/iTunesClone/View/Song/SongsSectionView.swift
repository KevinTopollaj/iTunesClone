//
//  SongsSectionView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct SongsSectionView: View {

  let songs: [Song]
  let rows = Array(repeating: GridItem(.fixed(60),
                                       spacing: 2,
                                       alignment: .leading),
                   count: 4)

  var body: some View {

    ScrollView(.horizontal, showsIndicators: false) {

      LazyHGrid(rows: rows, spacing: 15) {

        ForEach(songs) { song in

          NavigationLink {
            SongDetailView(song: song)
          } label: {
            SongRowView(song: song)
              .frame(width: 300)
          }
          .buttonStyle(.plain)

        }

      }
      .padding([.horizontal])

    }

  }
}

#Preview {
  NavigationView {
    SongsSectionView(songs: [Song.example()])
  }
}
