//
//  StringExtension.swift
//  demo
//
//  Created by Swapnil Raut on 7/26/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation
import UIKit

// MARK: -

extension NSMutableAttributedString {

   
    /// Helper method to return attributed bold string
    /// - Parameters:
    ///   - text: Input text
    ///   - size: optional size, default set to 16
    ///   - color: optional color, default set to white
    @discardableResult func bold(_ text: String, size: CGFloat = 16, color: UIColor = UIColor.white) -> NSMutableAttributedString {
        var boldFont: UIFont { return UIFont(name: Strings.Fonts.ttNormsBold, size: size) ?? UIFont.boldSystemFont(ofSize: size) }
        
        let attrs: [NSAttributedString.Key: Any] = [.font: boldFont, .foregroundColor: color]
        let boldString = NSMutableAttributedString(string: text, attributes: attrs)
        append(boldString)

        return self
    }

    /// Helper method to return attributed medium string
    /// - Parameters:
    ///   - text: Input text
    ///   - size: optional size, default set to 16
    ///   - color: optional color, default set to white
    @discardableResult func medium(_ text: String, size: CGFloat = 16, color: UIColor = UIColor.white) -> NSMutableAttributedString {
        var mediumFont: UIFont { return UIFont(name: Strings.Fonts.ttNormsMedium, size: size) ?? UIFont.systemFont(ofSize: size) }
        let attrs: [NSAttributedString.Key: Any] = [.font: mediumFont, .foregroundColor: color]
        let mediumString = NSMutableAttributedString(string: text, attributes: attrs)
        append(mediumString)

        return self
    }

    /// Helper method to return attributed regular string
    /// - Parameters:
    ///   - text: Input text
    ///   - size: optional size, default set to 16
    ///   - color: optional color, default set to white
    @discardableResult func regular(_ text: String, size: CGFloat = 16, color: UIColor = UIColor.white) -> NSMutableAttributedString {
        var regularFont: UIFont { return UIFont(name: Strings.Fonts.ttNormsRegular, size: size) ?? UIFont.systemFont(ofSize: size) }
        let attrs: [NSAttributedString.Key: Any] = [.font: regularFont, .foregroundColor: color]
        let regularString = NSMutableAttributedString(string: text, attributes: attrs)
        append(regularString)

        return self
    }
}
