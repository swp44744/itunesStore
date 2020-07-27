//
//  ArtistCollectionViewCell.swift
//  demo
//
//  Created by Swapnil Raut on 7/25/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let customeGray =  UIColor(red: (217.0 / 255.0), green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0)
    let artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor  = UIColor.white
        label.font = UIFont(name: Strings.Fonts.ttNorms, size: 14.0)
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textColor  = CustomColor.gray100
        label.font = UIFont(name: Strings.Fonts.ttNorms, size: 12.0)
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    
    public func setupView(with artist: ViewModels.ArtistListViewModel) {
        addSubViews()
        setConstraints()
        artistImageView.loadImage(from: artist.artistImageUrl, placeHolder: UIImage(imageLiteralResourceName: "no-image"))
        artistNameLabel.text = artist.artistName
        albumNameLabel.text = artist.albumName
    }
    
    // MARK: - Private Method
    
    private func addSubViews() {
        self.addSubview(artistImageView)
        self.addSubview(artistNameLabel)
        self.addSubview(albumNameLabel)
    }
    
    private func setConstraints() {
        artistImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        artistNameLabel.anchor(top: artistImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        albumNameLabel.anchor(top: artistNameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}
