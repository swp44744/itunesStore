//
//  Genres.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

// MARK: -

extension Models {

    // MARK: -

    public struct Genres: Codable {
        var genreId: String?
        var name: String?
        var url: String?
        
        public init() { }
    }
}
