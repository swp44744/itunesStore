//
//  itunesStoreTests.swift
//  itunesStoreTests
//
//  Created by Swapnil Raut on 7/27/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import XCTest
@testable import itunesStore

class itunesStoreTests: XCTestCase {

    // MARK: - Properties
    
    var serviceFactory: ServiceFactory!
    var contentFeedService: ContentFeedService!
    let defaultTimeout: TimeInterval = 5
    
    override func setUp() {
        serviceFactory = BaseServiceFactory()
        contentFeedService = serviceFactory.makeContentFeedService()
    }

    override func tearDown() {
        serviceFactory = nil
        contentFeedService = nil
    }

    func testFetchContentFeed() {
        let exp = expectation(description: "get - iTunes music feed")
        
        contentFeedService.getContentFeed(pageCount: 1) { result in
            switch result {
            case .success(let contentFeed):
                XCTAssertNotNil(contentFeed)
                if let feed = contentFeed.feed, let artist = feed.results?.first {
                    XCTAssertNotNil(artist)
                } else {
                    XCTFail("Response object is Nil!")
                }
            case .failure(_):
                XCTFail("Error fetching data!")
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: defaultTimeout) { (error) in
            if let error = error {
                XCTFail("expectation error: \(error)")
            }
        }
        
    }

}
