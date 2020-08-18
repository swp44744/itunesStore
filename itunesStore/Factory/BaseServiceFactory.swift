//
//  BaseServiceFactory.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

// MARK: - Protocol


/// Factory dependency injection
protocol ServiceFactory {
    func makeContentFeedService() -> ContentFeedService
}

struct BaseServiceFactory: ServiceFactory {
    
    // MARK: - Impl
    
    func makeContentFeedService() -> ContentFeedService { return ContentFeedService() }
    
}
