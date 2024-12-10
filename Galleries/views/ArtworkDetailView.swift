//
//  ArtworkDetailView.swift
//  Galleries
//
//  Created by Jelle Goemaere on 10/12/2024.
//

import SwiftUI

struct ArtworkDetailView: View {
    var artwork: Artwork
    var body: some View {
        Text(artwork.title)
    }
}

