//
//  GalleryDetailView.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import SwiftUI

struct GalleryDetailView: View {
    @Environment(PathStore.self) private var pathStore
    @Environment(GalleryDataStore.self) private var dataStore
    @State private var selectedArtist: Artist?
    var gallery: Gallery
    var body: some View {
        @Bindable var pathStore = pathStore
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
        }
        Divider()
        NavigationStack(path: $pathStore.path){
            List(dataStore.getArtists(), id:\.self, selection: $selectedArtist) { artist in
                NavigationLink(value: Route.artist(artist)){
                    VStack {
                        
                    }
                }
            }
        }
    }
}

