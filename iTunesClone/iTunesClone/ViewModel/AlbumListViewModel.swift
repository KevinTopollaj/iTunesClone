//
//  AlbumListViewModel.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Combine
import Foundation

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {

  @Published var searchTerm: String = ""
  @Published var albums: [Album] = [Album]()

  @Published var state: FetchState = .start {
    didSet {
      print("state is: \(state)")
    }
  }

  private let service = APIService()

  let limit = 20
  var page = 0

  private var subscriptions = Set<AnyCancellable>()

  init() {

    $searchTerm
      .removeDuplicates()
      .dropFirst()
      .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
      .sink { [weak self] term in

        self?.clear()
        self?.fetchAlbums(for: term)

      }
      .store(in: &subscriptions)
    
  }

  private func clear() {
    state = .start
    page = 0
    albums = []
  }

  func loadMore() {
    fetchAlbums(for: searchTerm)
  }

  func fetchAlbums(for searchTerm: String) {

    guard !searchTerm.isEmpty else { return }

    guard state == FetchState.start else { return }

    state = .isLoading

    service.fetchAlbums(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let albumResult):
          for album in albumResult.results {
            self?.albums.append(album)
          }

          self?.page += 1

          self?.state = (albumResult.results.count == self?.limit) ? .start : .loadedAll

        case .failure(let error):
          self?.state = .error("Could not load: \(error.localizedDescription)")
        }
      }
    }
    
  }

  // Preview data
  static func example() -> AlbumListViewModel {

    let vm = AlbumListViewModel()
    vm.albums = [Album.example()]
    return vm

  }

}
