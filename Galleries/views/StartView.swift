//poweroutlet.type.h
//  StartView.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import SwiftUI

struct StartView: View {
    @Environment(GalleryDataStore.self) private var galleryDataStore
    @Environment(PathStore.self) private var pathStore
    var body: some View {
        @Bindable var pathStore = pathStore
        TabView {
            Tab("Gallery",systemImage: "building.columns"){
                List(galleryDataStore.getGalleries(), id: \.self, selection: $pathStore.selectedGallery){ gallery in
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
            if pathStore.selectedGallery == nil {
                Tab("No gallery",systemImage: "paintpalette.fill"){
                    Text("No gallery selected")
                }
            }
            else {
                Tab(pathStore.selectedGallery!.name, systemImage: "paintpalette.fill"){
                    GalleryDetailView(gallery: pathStore.selectedGallery!)
                }
            }
        }
    }
}
