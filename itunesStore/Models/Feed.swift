//
//  Feed.swift
//  demo
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

// MARK: -

extension Models {

    // MARK: -

    public class Feed: Codable {
        
        var title: String?
        var id: String?
        var author: Models.Auther?
        var links: [Models.Links]?
        var copyright: String?
        var country: String?
        var icon: String?
        var updated: String?
        var results: [Artist]?
        
        public init() { }

    }

    
}
