//
//  DependencyFactory.swift
//  itunesStore
//
//  Created by Swapnil Raut on 8/17/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation
import DependencyContainer

class DependencyFactory {
    
    // MARK: - Register dependencies
    
    static func registerDependencies() {
        DependencyContainer.register(ContentFeedService.init())
    }
}
