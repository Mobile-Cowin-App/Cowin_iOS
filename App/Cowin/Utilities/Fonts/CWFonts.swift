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
    
    static var refresh: String {
        "\u{f01e}"
    }
    static var notification: String {
        return "\u{f0f3}"
    }
    
    struct tick {
        
        static var withFilled: String {
            "\u{f058}"
        }
    }
    
    struct close {
        static var icon: String {
            "\u{f00d}"
        }
        
        static var withFilled: String {
            "\u{f057}"
        }
    }
    
    struct chevronRightArrow {
        
        static var icon: String {
            return "\u{f105}"
        }
        
        static var withThickness: String {
            return "\u{f054}"
        }
        
        static var withFilled: String {
            return "\u{f138}"
        }
    }
    
    struct rightArrow {
        
        static var icon: String {
            return "\u{ea3c}"
        }
        
        static var withThickness: String {
            return "\u{f061}"
        }
        
        static var withStroke: String {
            return "\u{f18e}"
        }
        
        static var withFilled: String {
            return "\u{f0a9}"
        }
    }
    
    struct chevronLeftArrow {
        
        static var icon: String {
            return "\u{f104}"
        }
        
        static var withThickness: String {
            return "\u{f053}"
        }
        
        static var withFilled: String {
            return "\u{f137}"
        }
    }
    
    struct leftArrow {
        
        static var icon: String {
            return "\u{ea40}"
        }
        
        static var withThickness: String {
            return "\u{f060}"
        }
        
        static var withStroke: String {
            return "\u{f190}"
        }
        
        static var withFilled: String {
            return "\u{f0a8}"
        }
    }
}
