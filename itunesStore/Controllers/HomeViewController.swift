//
//  HomeViewController.swift
//  demo
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import UIKit

public protocol HomeViewProtocol: class {
    func startAnimating()
    func stopAnimating()
}

public protocol DetailViewModelProtocol {
    var detailViewModel: ViewModels.ArtistListViewModel? { get set }
}

class HomeViewController: UICollectionViewController, HomeViewProtocol, DetailViewModelProtocol {

    // MARK: - Properties

    var presenter: HomeViewPresenterProtocol?
    var activityIndicator: UIActivityIndicatorView!
    var detailViewModel: ViewModels.ArtistListViewModel?
    
    // MARK: - Constants
    let kArtistCellId = "aartistCellId"

    
     // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.alwaysBounceVertical = true
        presenter = HomeViewPresenter(with: self, factory: BaseServiceFactory())
        fetchContentFeed()
        setupView()
        setupNavigationBar()
        registerCells()
    }

}

// MARK: - Private Methods

extension HomeViewController {
    
    private func setupView() {
        collectionView.backgroundColor = CustomColor.gray200
        activityIndicator = setupActivityIndicator()
    }

        private func registerCells() {
            collectionView?.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: kArtistCellId)
        }
        
        private func fetchContentFeed() {
            self.presenter?.fetchContentFeed {
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
        }
    
    private func setupNavigationBar() {
        self.title = Strings.HomeView.navigationBarTitle
        self.navigationController?.navigationBar.barTintColor = CustomColor.gray200
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
    }
    
    /// Setting up delegate to send data to DetailViewController
    
    private func goToDetailViewController() {
        let detailViewController = DetailViewController()
        detailViewController.homeViewDelegate = self
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    private func setupConstraints() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.collectionView = collectionView
    }

}

// MARK: - Protocol implementation

extension HomeViewController {
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 20
        let height = width + 30

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

// MARK: - CollectionView DataSource

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let artist = presenter?.artistListViewModel else {
            return 0
        }
        return artist.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kArtistCellId, for: indexPath) as? ArtistCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let artist = presenter?.artistListViewModel {
            cell.setupView(with: artist[indexPath.item])
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let artistViewModel = presenter?.artistListViewModel {
            detailViewModel = artistViewModel[indexPath.item]
            goToDetailViewController()
        }
    }
}



