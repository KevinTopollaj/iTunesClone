//
//  AlbumDetailSongListViewModel.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

class AlbumDetailSongListViewModel: ObservableObject {

  let albumID: Int

  @Published var songs = [Song]()
  @Published var state = FetchState.start

  private let service = APIService()

  init(albumID: Int) {
    self.albumID = albumID
  }

  func fetch() {
    fetchSongs(for: albumID)
  }

  private func fetchSongs(for albumId: Int) {

    service.fetchSongs(for: albumId) { [weak self] result in

      DispatchQueue.main.async {
        switch result {
        case .success(let pageResult):

          var songs = pageResult.results

          if !songs.isEmpty {
            _ = songs.removeFirst()
          }

          self?.songs = songs.sorted(by: { $0.trackNumber < $1.trackNumber })
          self?.state = .start

        case .failure(let error):

          self?.state = .error(error.localizedDescription)

        }
      }

    }
  }


  static func example() -> AlbumDetailSongListViewModel {
    let vm = AlbumDetailSongListViewModel(albumID: 1)
    vm.songs = [Song.example()]
    return vm
  }

}
