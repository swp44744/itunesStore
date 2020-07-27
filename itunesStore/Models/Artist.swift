//
//  Artist.swift
//  demo
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

// MARK: -

extension Models {

    // MARK: -

    public struct Artist: Codable {
        var artistName: String?
        var id: String?
        var releaseDate: String?
        var name: String?
        var kind: String?
        var copyright: String?
        var artistId: String?
        var contentAdvisoryRating: String?
        var artistUrl: String?
        var artworkUrl100: String?
        var genres: [Models.Genres]?
        var url: String?
        
        public init() { }
    }
}
