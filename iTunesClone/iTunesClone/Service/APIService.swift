//
//  APIService.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

class APIService {

  func fetchAlbums(searchTerm: String,
                   page: Int,
                   limit: Int,
                   completion: @escaping (Result<AlbumResult,APIError>) -> Void) {

    let url = createURL(for: searchTerm, type: .album, page: page, limit: limit)
    fetch(type: AlbumResult.self, url: url, completion: completion)

  }

  func fetchAlbum(for albumId: Int, completion: @escaping (Result<AlbumResult, APIError>) -> Void) {

    let url = createURL(for: albumId, type: .album)
    fetch(type: AlbumResult.self, url: url, completion: completion)

  }

  func fetchSongs(for albumId: Int, completion: @escaping (Result<SongResult, APIError>) -> Void) {

    let url = createURL(for: albumId, type: .song)
    fetch(type: SongResult.self, url: url, completion: completion)

  }

  func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<SongResult, APIError>) -> Void) {

    let url = createURL(for: searchTerm, type: .song, page: page, limit: limit)
    fetch(type: SongResult.self, url: url, completion: completion)

  }

  func fetchMovies(searchTerm: String, completion: @escaping (Result<MovieResult, APIError>) -> Void) {

    let url = createURL(for: searchTerm, type: .movie, page: nil, limit: nil)
    fetch(type: MovieResult.self, url: url, completion: completion)

  }

  private func fetch<T: Codable>(type: T.Type, url: URL?, completion: @escaping (Result<T,APIError>) -> Void) {

    guard let url = url else {
      let error = APIError.badURL
      completion(.failure(error))
      return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in

      if let error = error as? URLError {

        let error = APIError.urlSessionError(error)
        completion(.failure(error))

      } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {

        completion(.failure(APIError.badResponse(response.statusCode)))

      } else if let data = data {

        do {
          let result = try JSONDecoder().decode(type, from: data)
          completion(.success(result))

        } catch {
          completion(.failure(APIError.decoding(error as? DecodingError)))
        }
      }

    }
    .resume()
  }

  // https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10

  private let baseURL = "https://itunes.apple.com"

  private func createURL(for searchTerm: String, type: EntityType, page: Int?, limit: Int?) -> URL? {

    var queryItems = [
      URLQueryItem(name: "term", value: searchTerm),
      URLQueryItem(name: "entity", value: type.rawValue)
    ]

    if let page = page, let limit = limit {
      let offset = page * limit
      queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
      queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
    }

    var components = URLComponents(string: baseURL)
    components?.path = "/search"
    components?.queryItems = queryItems
    return components?.url
  }

  //  https://itunes.apple.com/lookup?id=909253&entity=album.
  private func createURL(for id: Int, type: EntityType) -> URL? {

    let queryItems = [
      URLQueryItem(name: "id", value: String(id)),
      URLQueryItem(name: "entity", value: type.rawValue)
    ]

    var components = URLComponents(string: baseURL)
    components?.path = "/lookup"
    components?.queryItems = queryItems
    return components?.url

  }

}
