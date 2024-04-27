//
//  FetchState.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

enum FetchState: Comparable {
  case start
  case isLoading
  case loadedAll
  case error(String)
}
