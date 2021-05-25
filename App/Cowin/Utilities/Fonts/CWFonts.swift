//
//  CWFonts.swift
//  Cowin
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
    
    
    struct chevronRightArrow {
        
        static var icon: String {
            return "\u{f054}"
        }
        
        static var withFilled: String {
            return "\u{f138}"
        }
    }
    
    struct rightArrow {
        
        static var icon: String {
            return "\u{f061}"
        }
        
        static var withStroke: String {
            return "\u{f18e}"
        }
        
        static var withFilled: String {
            return "\u{f0a9}"
        }
    }
}
