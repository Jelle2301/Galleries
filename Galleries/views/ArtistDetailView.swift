//
//  ArtistDetailView.swift
//  Galleries
//
//  Created by Jelle Goemaere on 10/12/2024.
//

import SwiftUI

struct ArtistDetailView: View {
    var artist: Artist
    @Environment(PathStore.self) private var pathStore
    @State private var selectedArtwork: Artwork?
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path) {
        VStack {
            Text(artist.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.brown)
            Divider()
            Text(artist.nationality)
                .fontWeight(.bold)
            Text(artist.description)
            Divider()
            Text("List of art")
                .foregroundColor(Color.brown)
            Divider()
            List(artist.artworks, id:\.self, selection: $selectedArtwork) { artwork in
                    NavigationLink(value: Route.artwork(artwork)){
                        VStack {
                            Text(artwork.title)
                                .foregroundColor(Color.brown)
                                .fontWeight(.bold)
                            Text(artwork.description)
                                .foregroundColor(Color.gray)
                        }.frame(height:80)
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
