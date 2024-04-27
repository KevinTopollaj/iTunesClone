//
//  Song.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

// MARK: - SongResult
struct SongResult: Codable {
  let resultCount: Int
  let results: [Song]
}

// MARK: - Song
struct Song: Codable, Identifiable, Equatable, Hashable {
  let wrapperType: String
  let artistID: Int
  let collectionID: Int
  let id: Int
  let artistName: String
  let collectionName: String
  let trackName: String
  let artistViewURL: String?
  let collectionViewURL: String
  let trackViewURL: String
  let previewURL: String
  let artworkUrl30: String
  let artworkUrl60: String
  let artworkUrl100: String
  let collectionPrice: Double?
  let trackPrice: Double?
  let releaseDate: String
  let trackCount: Int
  let trackNumber: Int
  let trackTimeMillis: Int
  let country: String
  let currency: String
  let primaryGenreName: String
  let contentAdvisoryRating: String?

  enum CodingKeys: String, CodingKey {
    case wrapperType
    case artistID = "artistId"
    case collectionID = "collectionId"
    case id = "trackId"
    case artistName, collectionName, trackName
    case artistViewURL = "artistViewUrl"
    case collectionViewURL = "collectionViewUrl"
    case trackViewURL = "trackViewUrl"
    case previewURL = "previewUrl"
    case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating
  }

  init(wrapperType: String, artistID: Int, collectionID: Int, id: Int, artistName: String, collectionName: String, trackName: String, artistViewURL: String?, collectionViewURL: String, trackViewURL: String, previewURL: String, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double?, trackPrice: Double?, releaseDate: String, trackCount: Int, trackNumber: Int, trackTimeMillis: Int, country: String, currency: String, primaryGenreName: String, contentAdvisoryRating: String?) {

    self.wrapperType = wrapperType
    self.artistID = artistID
    self.collectionID = collectionID
    self.id = id
    self.artistName = artistName
    self.collectionName = collectionName
    self.trackName = trackName
    self.artistViewURL = artistViewURL
    self.collectionViewURL = collectionViewURL
    self.trackViewURL = trackViewURL
    self.previewURL = previewURL
    self.artworkUrl30 = artworkUrl30
    self.artworkUrl60 = artworkUrl60
    self.artworkUrl100 = artworkUrl100
    self.collectionPrice = collectionPrice
    self.trackPrice = trackPrice
    self.releaseDate = releaseDate
    self.trackCount = trackCount
    self.trackNumber = trackNumber
    self.trackTimeMillis = trackTimeMillis
    self.country = country
    self.currency = currency
    self.primaryGenreName = primaryGenreName
    self.contentAdvisoryRating = contentAdvisoryRating

  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.wrapperType = try container.decode(String.self, forKey: .wrapperType)
    self.artistID = try container.decode(Int.self, forKey: .artistID)
    self.collectionID = try container.decode(Int.self, forKey: .collectionID)
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.artistName = try container.decode(String.self, forKey: .artistName)
    self.collectionName = try container.decode(String.self, forKey: .collectionName)
    self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
    self.artistViewURL = try container.decodeIfPresent(String.self, forKey: .artistViewURL)
    self.collectionViewURL = try container.decode(String.self, forKey: .collectionViewURL)
    self.trackViewURL = try container.decodeIfPresent(String.self, forKey: .trackViewURL) ?? ""
    self.previewURL = try container.decodeIfPresent(String.self, forKey: .previewURL) ?? ""
    self.artworkUrl30 = try container.decodeIfPresent(String.self, forKey: .artworkUrl30) ?? ""
    self.artworkUrl60 = try container.decode(String.self, forKey: .artworkUrl60)
    self.artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
    self.collectionPrice = try container.decodeIfPresent(Double.self, forKey: .collectionPrice)
    self.trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)
    self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
    self.trackCount = try container.decode(Int.self, forKey: .trackCount)
    self.trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber) ?? 1
    self.trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis) ?? 1
    self.country = try container.decode(String.self, forKey: .country)
    self.currency = try container.decode(String.self, forKey: .currency)
    self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
    self.contentAdvisoryRating = try container.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
  }

  // Preview data
  static func example() -> Song {
    Song(wrapperType: "Song", artistID: 1, collectionID: 1, id: 1, artistName: "This Bike Is a Pipe Bomb", collectionName: "Three Way Tie for a Fifth", trackName: "Jack Johnson", artistViewURL: "https://music.apple.com/us/artist/this-bike-is-a-pipe-bomb/41742672?uo=4", collectionViewURL: "https://music.apple.com/us/album/jack-johnson/263301268?i=263301273&uo=4", trackViewURL: "https://music.apple.com/us/album/jack-johnson/263301268?i=263301273&uo=4", previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/fd/bb/38/fdbb38d2-073d-4bc7-68c4-348a0be6d560/mzaf_4150435585996894188.plus.aac.p.m4a", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/f3/ee/b3/f3eeb3ff-ca32-273a-15aa-709bdfa64367/mzi.izwiyqez.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/f3/ee/b3/f3eeb3ff-ca32-273a-15aa-709bdfa64367/mzi.izwiyqez.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/f3/ee/b3/f3eeb3ff-ca32-273a-15aa-709bdfa64367/mzi.izwiyqez.jpg/100x100bb.jpg", collectionPrice: 9.99, trackPrice: 1.99, releaseDate: "2004-06-15T12:00:00Z", trackCount: 11, trackNumber: 11, trackTimeMillis: 117573, country: "USA", currency: "USD", primaryGenreName: "Alternative", contentAdvisoryRating: nil)
  }
}
