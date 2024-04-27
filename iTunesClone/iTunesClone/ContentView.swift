//
//  ContentView.swift
//  iTunesClone
//
//  Created by Kevin Topollaj.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    
    TabView {

      SearchView()
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }

      SongSearchView()
        .tabItem {
          Label("Songs", systemImage: "music.note.list")
        }


      AlbumSearchView()
        .tabItem {
          Label("Albums", systemImage: "rectangle.stack.badge.play")
        }

      MovieSearchView()
        .tabItem {
          Label("Movies", systemImage: "film")
        }

    }

  }
}

#Preview {
    ContentView()
}
