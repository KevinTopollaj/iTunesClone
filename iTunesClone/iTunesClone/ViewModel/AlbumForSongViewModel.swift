//
//  AlbumForSongViewModel.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Combine
import Foundation

class AlbumForSongViewModel: ObservableObject {

  @Published var album: Album? = nil
  @Published var state: FetchState = .start

  let service = APIService()

  func fetch(song: Song) {

    let albumId = song.collectionID

    state = .isLoading

    service.fetchAlbum(for: albumId) { [weak self] result in

      DispatchQueue.main.async {
        switch result {
        case .success(let albumResult):
          
          self?.album = albumResult.results.first

        case .failure(let error):

          self?.state = .error(error.localizedDescription)
        }

      }
      
    }

  }

}
