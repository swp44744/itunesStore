//
//  ContentFeedService.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

class ContentFeedService {
    
    // MARK: - Init
    init() { }
    
    
    // MARK: - Public Methods
    /// Get content feed for desired artists
    /// - Parameters:
    ///   - url: Network request URL
    ///   - callback: Callback to send data to presenter
    func getContentFeed(pageCount: Int, callback: @escaping (_ result: SessionResult<Models.FeedContainer, Types.NetworkResponseError>) -> Void) {
        let urlString = Strings.Network.getContentFeedServiceUrl(with: pageCount)
        guard let url = URL(string: urlString) else {
            callback(SessionResult.failure(.readError))
            return
        }
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                callback(SessionResult.failure(.failedToFetchData))
            }
            
            if let data = data {
                let contentFeed = try! JSONDecoder().decode(Models.FeedContainer.self, from: data)
                callback(SessionResult.success(contentFeed))
            }
        }.resume()
    }
}
