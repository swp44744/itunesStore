//
//  HomeViewPresenter.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation
import DependencyContainer

public protocol HomeViewPresenterProtocol {
    func fetchContentFeed(callback: @escaping () -> Void)
    var artistListViewModel: [ViewModels.ArtistListViewModel]? { get set }
}

class HomeViewPresenter: HomeViewPresenterProtocol {

    // MARK: - TypeAlias
    
    typealias Factory = ServiceFactory

    // MARK: - Properties
    
    weak var view: HomeViewProtocol?
    var artistListViewModel: [ViewModels.ArtistListViewModel]?
    
    
    /// Setting up viewModel as soon as data is fetched and model is set
    
    var contentFeed: Models.Feed? {
        didSet {
            if let feed = contentFeed {
                artistListViewModel = feed.results?.compactMap({
                    if let url = $0.artworkUrl100,
                        let artist = $0.artistName,
                        let album = $0.name,
                        let genres = $0.genres,
                        let releaseDate = $0.releaseDate,
                        let copyright = $0.copyright {
                        return ViewModels.ArtistListViewModel(artistImageUrl: url,
                                                              artistName: artist,
                                                              albumName: album,
                                                              genres: genres,
                                                              releaseDate: releaseDate,
                                                              copyright: copyright)
                    }
                    return nil
                })
            }
            
        }
    }
    private var contentFeedService: ContentFeedService

    // MARK: - Contants
    
    // MARK: - Initializer
    init(with view: HomeViewProtocol) {
        self.view = view
        contentFeedService = DependencyContainer.resolve()
    }
    
    // MARK: - Protocol Impl
    
    /// This method will retrieve data from service layer to view
    /// - Parameter callback: callback so that collectio view can be reloaded after fetching is complete
    
    func fetchContentFeed(callback: @escaping () -> ()) {
        view?.startAnimating()
        contentFeedService.getContentFeed(pageCount: 200) { [weak self] result in
            switch result {
            case .success(let feed):
                self?.contentFeed = feed.feed
                callback()
            case .failure(let error):
                print("\(error)")
                callback()
            }
            self?.view?.stopAnimating()
        }
    }
}
