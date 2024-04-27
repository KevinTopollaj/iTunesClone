//
//  SearchPlaceholderView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct SearchPlaceholderView: View {

  @Binding var searchTerm: String

  let suggestions = ["Metallica", "Scorpions", "ACDC", "White Snake", "Hollywood", "The Matrix"]

  var body: some View {

    VStack(spacing: 10) {

      Text("Trending")
        .font(.title)
        .padding(.bottom, 10)

      ForEach(suggestions, id: \.self) { text in

        Button {
          searchTerm = text
        } label: {
          Text(text)
            .font(.title3)
        }

      }

    }

  }

}

#Preview {
  SearchPlaceholderView(searchTerm: .constant(""))
}
