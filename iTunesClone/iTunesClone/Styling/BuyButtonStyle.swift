//
//  BuyButtonStyle.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.subheadline)
      .foregroundColor(.accentColor)
      .padding(.vertical, 5)
      .padding(.horizontal, 10)
      .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.accentColor, lineWidth: 1))
      .opacity(configuration.isPressed ? 0.5 : 1)

  }
}

#Preview {
  VStack {
    Button("1.99 USD") {
      
    }
    .buttonStyle(BuyButtonStyle())
  }
}
