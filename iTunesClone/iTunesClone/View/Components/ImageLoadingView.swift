//
//  ImageLoadingView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct ImageLoadingView: View {

  let urlString: String
  let width: CGFloat
  let height: CGFloat


  var body: some View {
    AsyncImage(url: URL(string: urlString)) { image in
      
      image
        .resizable()
        .border(Color(white: 0.8))
        .scaledToFit()

    } placeholder: {
      ProgressView()
    }
    .frame(width: width, height: height)
  }
}

#Preview {
  ImageLoadingView(urlString: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/f3/ee/b3/f3eeb3ff-ca32-273a-15aa-709bdfa64367/mzi.izwiyqez.jpg/100x100bb.jpg", width: 60, height: 60)
}
