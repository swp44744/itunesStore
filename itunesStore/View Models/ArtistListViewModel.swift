//
//  ArtistListViewModel.swift
//  demo
//
//  Created by Swapnil Raut on 7/26/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

// MARK: -

extension ViewModels {
    
    public struct ArtistListViewModel {
        
        // MARK: -
        
        public let artistImageUrl: String
        public let artistName: String
        public let albumName: String
        public let genres: [Models.Genres]
        public let releaseDate: String
        public let copyright: String
        
        public init(artistImageUrl: String, artistName: String, albumName: String, genres: [Models.Genres], releaseDate: String, copyright: String) {
            self.artistImageUrl = artistImageUrl
            self.artistName = artistName
            self.albumName = albumName
            self.genres = genres
            self.releaseDate = releaseDate
            self.copyright = copyright
        }
    }
}
