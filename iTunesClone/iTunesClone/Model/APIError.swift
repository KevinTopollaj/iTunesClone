//
//  APIError.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import Foundation

enum APIError: Error, CustomStringConvertible {

  case badURL
  case urlSessionError(URLError?)
  case badResponse(Int)
  case decoding(DecodingError?)
  case unknown

  var description: String {
    switch self {
    case .badURL:
      return "bad url"
    case .urlSessionError(let error):
      return "urlSession error: \(error.debugDescription)"
    case .badResponse(let statusCode):
      return "bad response with status code: \(statusCode)"
    case .decoding(let decodingError):
      return "decoding error: \(decodingError)"
    case .unknown:
      return "unknown error"
    }
  }

  var localizedDescription: String {
    switch self {
    case .badURL:
      return "something went wrong"
    case .urlSessionError(let urlError):
      return urlError?.localizedDescription ?? "something went wrong"
    case .badResponse(_):
      return "something went wrong"
    case .decoding(let decodingError):
      return decodingError?.localizedDescription ?? "something went wrong"
    case .unknown:
      return "something went wrong"
    }
  }
}
