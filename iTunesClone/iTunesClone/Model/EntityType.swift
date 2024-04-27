//
//  EntityType.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
  case all
  case album
  case song
  case movie

  var id: String {
    return self.rawValue
  }

  var name: String {

    switch self {
    case .all:
      return "All"
    case .album:
      return "Albums"
    case .song:
      return "Songs"
    case .movie:
      return "Movies"
    }

  }

}
