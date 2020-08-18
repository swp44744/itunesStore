//
//  DetailViewController.swift
//  itunesStore
//
//  Created by Swapnil Raut on 7/26/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var homeViewDelegate: DetailViewModelProtocol?
    
    let viewiTuneStoreButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.DetailView.iTuneButtonText, for: .normal)
        button.backgroundColor = CustomColor.gray300
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
        }()

    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    let artistNameLabel = UILabel()
    let albumNameLabel = UILabel()
    let genreLabel = UILabel()
    let releaseDateLabel = UILabel()
    let copyrightLabel = UILabel()
    
    // MARK: - Life cycle methods
    
    override func loadView() {
        super.loadView()
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = CustomColor.gray200
    }
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        addButtonTarget()
    }
    
    // MARK: - Action methods
    @objc func iTuneStoreButtonTapped(_ sender: UIButton) {
        goToiTunesStore()
    }
    
    // MARK: - Private properties
    
    private func setupViews() {
        view.addSubview(detailImageView)
        view.addSubview(artistNameLabel)
        view.addSubview(albumNameLabel)
        view.addSubview(genreLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(copyrightLabel)
        view.addSubview(viewiTuneStoreButton)
        
        guard let detailViewModel = homeViewDelegate?.detailViewModel else {
            return
        }
        
        detailImageView.loadImage(from: detailViewModel.artistImageUrl, placeHolder: UIImage(named: "no-image"))
        artistNameLabel.attributedText = NSMutableAttributedString().bold(detailViewModel.artistName, size: 18)
        albumNameLabel.attributedText = NSMutableAttributedString().bold(detailViewModel.albumName, size: 16, color: CustomColor.gray100)
        genreLabel.attributedText = NSMutableAttributedString().bold(detailViewModel.genres[0].name ?? "", size: 16, color: CustomColor.gray100)
        copyrightLabel.attributedText = NSMutableAttributedString().medium(detailViewModel.copyright, size: 14, color: CustomColor.gray100)
        releaseDateLabel.attributedText = NSMutableAttributedString()
            .bold(Strings.DetailView.releasedOn, color: CustomColor.gray100)
            .medium(detailViewModel.releaseDate, size: 14, color: CustomColor.gray100)
        
    }
    
    /// This method will setup constraints on Detail View
    
    private func setupConstraints() {
        detailImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 24, paddingBottom: 0, paddingRight: -24, width: view.frame.width - 48)
        artistNameLabel.anchor(top: detailImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 24, paddingBottom: 0, paddingRight: -24)
        albumNameLabel.anchor(top: artistNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 24, paddingBottom: 0, paddingRight: -24)
        genreLabel.anchor(top: albumNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 24, paddingBottom: 0, paddingRight: -24)
        releaseDateLabel.anchor(top: genreLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 24, paddingBottom: 0, paddingRight: -24)
        copyrightLabel.anchor(top: releaseDateLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 24, paddingBottom: 0, paddingRight: -24)
        viewiTuneStoreButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: -20)
    }

    private func addButtonTarget() {
        viewiTuneStoreButton.addTarget(self, action: #selector(iTuneStoreButtonTapped), for: .touchUpInside)
    }
    
    private func goToiTunesStore() {
        if let urlString = homeViewDelegate?.detailViewModel?.genres[0].url, let url = URL(string: urlString) {
           if #available(iOS 10.0, *) {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           } else {
               // Earlier versions
               if UIApplication.shared.canOpenURL(url as URL) {
                  UIApplication.shared.openURL(url as URL)
               }
           }
        }
    }
}
