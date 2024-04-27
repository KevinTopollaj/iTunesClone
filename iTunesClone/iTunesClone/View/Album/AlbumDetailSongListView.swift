//
//  AlbumDetailSongListView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct AlbumDetailSongListView: View {

  @ObservedObject var viewModel: AlbumDetailSongListViewModel

  let selectedSong: Song?

  var body: some View {

    ScrollViewReader { proxy in

      ScrollView {

        if viewModel.state == .isLoading {
          ProgressView()
            .progressViewStyle(.circular)

        } else if !viewModel.songs.isEmpty {

          Group {

            if #available(iOS 16, *) {
              SongGridView(songs: viewModel.songs,
                           selectedSong: selectedSong)
            } else {
              SongStackView(songs: viewModel.songs,
                            selectedSong: selectedSong)
            }

          }
          .onAppear {
            proxy.scrollTo(selectedSong?.trackNumber, anchor: .center)
          }

        }
        
      }

    }

  }

}

#Preview {
  AlbumDetailSongListView(viewModel: AlbumDetailSongListViewModel.example(), selectedSong: nil)
}

// Will be used for iOS 16
@available(iOS 16.0, *)
struct SongGridView: View {

  let songs: [Song]
  let selectedSong: Song?

  var body: some View {
    Grid(horizontalSpacing: 20) {
      
      ForEach(songs) { song in
        
        GridRow {
          Text("\(song.trackNumber)")
            .font(.footnote)
            .gridColumnAlignment(.trailing)
          
          Text(song.trackName)
            .gridColumnAlignment(.leading)
          
          Spacer()
          
          Text(formattedDuration(time: song.trackTimeMillis))
            .font(.footnote)
          
          BuySongButtonView(urlString: song.trackViewURL,
                            price: song.trackPrice,
                            currency: song.currency)
          
        }
        .foregroundStyle(selectedSong == song ? Color.accentColor : Color(.label))
        .id(song.trackNumber)
        
        Divider()
        
      }
    }
    .padding([.vertical, .leading])
  }

}

// Will be used for iOS 15
struct SongStackView: View {

  let songs: [Song]
  let selectedSong: Song?

  var body: some View {
    VStack {

      ForEach(songs) { song in

        HStack {
          Text("\(song.trackNumber)")
            .font(.footnote)
            .frame(width: 25, alignment: .trailing)

          Text(song.trackName)

          Spacer()

          Text(formattedDuration(time: song.trackTimeMillis))
            .font(.footnote)
            .frame(width: 40)

          BuySongButtonView(urlString: song.trackViewURL,
                            price: song.trackPrice,
                            currency: song.currency)
          .padding(.trailing)

        }
        .foregroundStyle(selectedSong == song ? Color.accentColor : Color(.label))
        .id(song.trackNumber)

        Divider()

      }
    }

  }

}


fileprivate func formattedDuration(time: Int) -> String {

  let timeInSeconds = time / 1000

  let interval = TimeInterval(timeInSeconds)
  let formatter = DateComponentsFormatter()
  formatter.zeroFormattingBehavior = .pad
  formatter.allowedUnits = [.minute, .second]
  formatter.unitsStyle = .positional

  return formatter.string(from: interval) ?? ""
}
