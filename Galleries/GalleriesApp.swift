//
//  GalleriesApp.swift
//  Galleries
//
//  Created by Jelle Goemaere on 03/12/2024.
//

import SwiftUI

@main
struct GalleriesApp: App {
    @State var dataStore = GalleryDataStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataStore)
                .environment(pathStore)
        }
    }
}
