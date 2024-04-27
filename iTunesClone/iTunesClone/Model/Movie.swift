//
//  Movie.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Movie
struct Movie: Codable, Identifiable {
    let wrapperType, kind: String
    let artistID: Int?
    let trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription, longDescription: String?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?

  var id: Int {
    return trackID
  }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
    }

  // Preview data
  static func example() -> Movie {

    Movie(wrapperType: "track", kind: "feature-movie", artistID: 1, trackID: 1, artistName: "Jack Johnson", trackName: "En Concert", trackCensoredName: "En Concert", artistViewURL: "https://music.apple.com/us/artist/jack-johnson/909253?uo=4", trackViewURL: "https://itunes.apple.com/us/movie/en-concert/id1467927519?uo=4", previewURL: "https://video-ssl.itunes.apple.com/itunes-assets/Video128/v4/be/ef/af/beefaffe-6278-4336-07a1-de180ddaeaf8/mzvf_1177979557611386379.640x468.h264lc.U.p.m4v", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video/8b/ea/6c/mzi.gnjahvkg.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video/8b/ea/6c/mzi.gnjahvkg.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video/8b/ea/6c/mzi.gnjahvkg.jpg/100x100bb.jpg", collectionPrice: 12.99, trackPrice: 12.99, releaseDate: "2009-01-01T08:00:00Z", collectionExplicitness: "notExplicit", trackExplicitness: "notExplicit", trackTimeMillis: 4773648, country: "USA", currency: "USD", primaryGenreName: "Concert Films", contentAdvisoryRating: "NR", shortDescription: "Jack Johnson:: En Concert", longDescription: "Jack Johnson:: En ConcertA Live Film and Album.Words by Emmett Malloy (filmmaker)I began making films about 10 years ago with Jack. We became good friends right away, and seemed to be into the same sort of films, but both ofus did not know a whole lot about the process. So we started with what we knew best…making surf films. We made a couple of films together,and it wasn’t long before Jack figured out making music was his real calling. So I lost my favorite cinematographer in Jack, but gained a newfavorite musician.Now several years later, I have been lucky enough to be able to document the last decade of Jack’s music career. This past summer, a coupleof friends and I went to Europe with Jack and his band for a tour supporting his last record, Sleep Through the Static. We brought a couple ofcameras and microphones because it seemed like a great tour to capture. Jack Johnson::En Concert was the result of that decision.There was a point in the middle of the European tour where I was on stage behind Jack as he sang one of his most intimate love songs, “BetterTogether”. Looking through my lens I focused in on Jack standing alone in front of 20,000 fans. Lighters and cell phones lit up the crowd, illuminatingmost all of the audience that was singing along. It was the biggest backup vocal section I had ever witnessed, and it looked and soundedbeautiful. As I focused my camera on the crowd, I began to see all the details of the fans. What went through my head was that we were in Paris,France, and suddenly the language barrier had no restrictions. Everyone knew the translation for Jack’s simple message, that “it’s so much betterwhen we’re together.”This connection with the fans continued to happen in every country we traveled to around the world. These simple messages and testaments oflove and family are what make Jack’s music so popular around the globe. As the filmmaker I really enjoyed being able to document the honestrelationship between an artist and his fans. No matter where we were in the world that year, it was clear that everyone understood and believedin what Jack was singing about.Jack Johnson:: En Concert is a documentation of Jack and his band playing some of the most historic venues throughout Europe, and everythinginteresting they did in between shows.Jack really does not like to be on the other side of the lens. Getting a shot of him is kind of similar to getting a shot of the Loch Ness Monster;it’s a rare occurrence. Surprisingly, he let our cameras really join him on this tour. I just knew that I better keep a guitar or surfboard in hishands, because with either of those weapons he seemed to never know we were there.Enjoy the film.Emmett MalloyJACK JOHNSONEN CONCERT", trackRentalPrice: 3.23, collectionHDPrice: 3.43, trackHDPrice: 3.54, trackHDRentalPrice: 4.52)
  }
}
