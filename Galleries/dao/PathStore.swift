//
//  PathStore.swift
//  Galleries
//
//  Created by Jelle Goemaere on 05/12/2024.
//

import Foundation
@Observable
class PathStore {
    var path = [Route]()
    private var _selecetedGallery: Gallery?
    
    var selectedGallery: Gallery? {
        get {
           return _selecetedGallery
        } set {
            path = [Route]()
            _selecetedGallery = newValue
        }
    }
    
    func reduceArray(index: Int){
        path = Array(path.prefix(index + 1))
    }
    
    func clear(){
        path.removeAll()
    }
}
