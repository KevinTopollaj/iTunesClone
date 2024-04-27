//
//  BuyButtonView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

// Abstraction View used in AlbumDetailSongListView

struct BuySongButtonView: View {

  let urlString: String
  let price: Double?
  let currency: String

  var body: some View {

    if let price = price {
      BuyButtonView(urlString: urlString,
                    price: price,
                    currency: currency)
    } else {
      Text("ALBUM ONLY")
        .font(.footnote)
        .foregroundStyle(.gray)
    }

  }
}

struct BuyButtonView: View {

  let urlString: String
  let price: Double?
  let currency: String

  var body: some View {
    
    if let url = URL(string: urlString), 
        let priceText = formattedPrice() {
      Link(destination: url) {
        Text(priceText)
          .font(.caption)
      }
      .buttonStyle(BuyButtonStyle())
    }

  }

  func formattedPrice() -> String? {

    guard let price = price else { return nil }

    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = currency

    let priceString = formatter.string(from: NSNumber(value: price))
    return priceString

  }
}

#Preview {
  BuyButtonView(urlString: "https://music.apple.com/us/album/jack-johnson/263301268?i=263301273&uo=4",
                price: 1.99,
                currency: "USD")
}
