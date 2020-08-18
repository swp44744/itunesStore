//
//  FeedContainer.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation
// MARK: -

extension Models {
    
    // MARK: -
    
    public struct FeedContainer: Codable {
        var feed: Models.Feed?
        
        public init() { }
    }
}
