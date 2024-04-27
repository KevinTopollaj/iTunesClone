//
//  MovieListViewModel.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Combine
import Foundation

class MovieListViewModel: ObservableObject {

  @Published var searchTerm: String = ""
  @Published var movies: [Movie] = [Movie]()

  @Published var state: FetchState = .start {
    didSet {
      print("state is: \(state)")
    }
  }

  private let service = APIService()

  private var subscription = Set<AnyCancellable>()

  init() {

    $searchTerm
      .removeDuplicates()
      .dropFirst()
      .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
      .sink { [weak self] term in

        self?.state = .start
        self?.movies = []
        self?.fetchMovies(for: term)
      }
      .store(in: &subscription)
  }

  func loadMore() {
    fetchMovies(for: searchTerm)
  }

  func fetchMovies(for searchTerm: String) {

    guard !searchTerm.isEmpty else { return }

    guard state == FetchState.start else { return }

    state = .isLoading

    service.fetchMovies(searchTerm: searchTerm) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let movieResult):

          self?.movies = movieResult.results

          self?.state = .start

        case .failure(let error):

          self?.state = .error("Could not load: \(error.localizedDescription)")
        }
      }
    }

  }

  // Preview data
  static func example() -> MovieListViewModel {

    let vm = MovieListViewModel()
    vm.movies = [Movie.example()]
    return vm

  }
}
