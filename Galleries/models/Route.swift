//
//  Route.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import Foundation
enum Route: Hashable {
    case gallery(Gallery)
    case artist(Artist)
    case artwork(Artwork)
}
