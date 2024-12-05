//
//  GalleryDataStore.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import Foundation
@Observable
class GalleryDataStore {
    private var galleryList: Galleries = load("galleries.json")
    
    func getGalleries() -> [Gallery] {
        return galleryList.galleries
    }
    func getArtists() -> [Artist] {
        let galleries = getGalleries()
        var artists = [Artist]()
        for gallery in galleries {
            for artist in gallery.artists {
                artists.append(artist)
            }
        }
        return Array(Set(artists))
    }
}
