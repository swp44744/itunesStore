//
//  UIViewControllerExtension.swift
//  demo
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import UIKit

// MARK: -

public extension UICollectionViewController {
    
    // MARK: -

    
    /// Setup a activity indicator
    
    func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.alpha = 1.0
        activityIndicator.color = UIColor.white
        self.collectionView.addSubview(activityIndicator)
        activityIndicator.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)

        return activityIndicator
    }
}
