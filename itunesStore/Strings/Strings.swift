//
//  Strings.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/27/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation
// MARK: -

extension Strings {
    
    //MARK: - Detail View Strings
    
    public enum DetailView {
        public static let iTuneButtonText = "iTune Store"
        public static let releasedOn = "Released on "
    }
    
    //MARK: - Home View Strings
    
    public enum HomeView {
        public static let navigationBarTitle = "Albums"
    }
    
    //MARK: - Fonts
    public enum Fonts {
        public static let ttNorms = "TTNorms"
        public static let ttNormsRegular = "TTNorms-Regular"
        public static let ttNormsMedium = "TTNorms-Medium"
        public static let ttNormsBold = "TTNorms-Bold"
    }
    
    //MARK: - Network
    public enum Network {
        public static func getContentFeedServiceUrl(with pageCount: Int) -> String {
            return "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/\(pageCount)/explicit.json"
        }
    }
}

