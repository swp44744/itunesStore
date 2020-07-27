//
//  UIViewExtension.swift
//  demo
//
//  Created by Swapnil Raut on 7/25/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import UIKit

// MARK: -

extension UIView {
    
    // MARK: -
    
    /// Helper extension on UIView to setup anchor constraints
    /// - Parameters:
    ///   - top: top anchor of parent view
    ///   - left: left anchor of parent view
    ///   - bottom: bottom anchor of parent view
    ///   - right: right anchor of parent view
    ///   - paddingTop: optional padding between parent view and top anchor
    ///   - paddingLeft: optional padding between parent view and left anchor
    ///   - paddingBottom: optional padding between parent view and bottom anchor
    ///   - paddingRight: optional padding between parent view and right anchor
    ///   - width: optional width
    ///   - height: optional height
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat     = 0,
                paddingLeft: CGFloat    = 0,
                paddingBottom: CGFloat  = 0,
                paddingRight: CGFloat   = 0,
                width: CGFloat          = 0,
                height: CGFloat         = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }

        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }

        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if width != 0 {
            self.heightAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
