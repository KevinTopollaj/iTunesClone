//
//  SongListViewModel.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Combine
import Foundation

class SongListViewModel: ObservableObject {

  @Published var searchTerm: String = ""
  @Published var songs: [Song] = [Song]()

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
        self?.fetchSongs(for: term)

      }
      .store(in: &subscriptions)

  }

  private func clear() {
    state = .start
    page = 0
    songs = []
  }

  func loadMore() {
    fetchSongs(for: searchTerm)
  }

  func fetchSongs(for searchTerm: String) {

    guard !searchTerm.isEmpty else { return }

    guard state == FetchState.start else { return }

    state = .isLoading

    service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let songResult):
          for song in songResult.results {
            self?.songs.append(song)
          }

          self?.page += 1

          self?.state = (songResult.results.count == self?.limit) ? .start : .loadedAll

        case .failure(let error):
          self?.state = .error("Could not load: \(error.localizedDescription)")
          print(error)
        }
      }
    }

  }

  // Preview data
  static func example() -> SongListViewModel {

    let vm = SongListViewModel()
    vm.songs = [Song.example()]
    return vm

  }
}
