//
//  CWFonts.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit

extension UIFont {
    static func getIconFont(with size: CGFloat) -> UIFont? {
        return UIFont(name: "icomoon", size: size)
    }
}

struct CWFonts {
    static let write = "\u{e901}"
    static let next = "\u{f054}"
    static let close = "\u{f00d}"
}
