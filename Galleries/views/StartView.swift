//poweroutlet.type.h
//  StartView.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import SwiftUI

struct StartView: View {
    @Environment(GalleryDataStore.self) private var galleryDataStore
    @State private var selectedGallery: Gallery?
    var body: some View {
        TabView {
            Tab("Gallery",systemImage: "building.columns"){
                List(galleryDataStore.getGalleries(), id: \.self, selection: $selectedGallery){ gallery in
                    VStack {
                        Text(gallery.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.brown)
                        Text(gallery.location)
                            .fontWeight(.bold)
                        Text(gallery.description)
                    }.frame(height:80)
                }
            }
            if selectedGallery == nil {
                Tab("No gallery",systemImage: "paintpalette.fill"){
                    Text("No gallery selected")
                }
            }
            else {
                Tab(selectedGallery!.name, systemImage: "paintpalette.fill"){
                    GalleryDetailView(gallery: selectedGallery!)
                }
            }
        }
    }
}
