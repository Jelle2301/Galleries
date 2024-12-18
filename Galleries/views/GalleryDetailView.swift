//
//  GalleryDetailView.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import SwiftUI

struct GalleryDetailView: View {
    @Environment(PathStore.self) private var pathStore
    @State private var selectedArtist: Artist?
    var gallery: Gallery
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path) {
        VStack {
            Text(gallery.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.brown)
            Divider()
            Text(gallery.location)
                .fontWeight(.bold)
            Text(gallery.description)
            Divider()
            Text("List of artists")
                .foregroundColor(Color.brown)
            Divider()
                List(gallery.artists, id:\.self, selection: $selectedArtist) { artist in
                    NavigationLink(value: Route.artist(artist)){
                        VStack {
                            Text(artist.name)
                                .foregroundColor(Color.brown)
                                .fontWeight(.bold)
                            Text(artist.nationality)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.navigationDestination(for:Route.self){ route in
                    switch route {
                    case let .artist(artist):
                        ArtistDetailView(artist: artist)
                    case let .artwork(artwork):
                        ArtworkDetailView(artwork: artwork)
                    }
                }
            }
        }
    }
}

