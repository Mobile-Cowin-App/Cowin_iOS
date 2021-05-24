//
//  CWColors.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import Foundation
import UIKit

struct CWStyle {
    
    struct Background {
        
        static var primary: UIColor {
            UIColor(named: "CWPrimaryBG") ?? .defaultValue
        }
        
        static var secondary: UIColor {
            UIColor(named: "CWSecondaryBG") ?? .defaultValue
        }
    }
    
    struct Text {
        
        static var primary: UIColor {
            UIColor(named: "CWPrimaryText") ?? .defaultValue
        }
        
        static var secondary: UIColor {
            UIColor(named: "CWSecondaryText") ?? .defaultValue
        }
    }
    
    struct Border {
        
        static var primary: UIColor {
            UIColor(named: "CWPrimaryBorder") ?? .defaultValue
        }
    }
    
    struct Static {
        
        static var appTheme: UIColor {
            return UIColor.systemBlue
        }
        
        static let red                      = #colorLiteral(red: 0.7725490196, green: 0.2, blue: 0.2, alpha: 1)
        static let green                    = #colorLiteral(red: 0.003921568627, green: 0.6274509804, blue: 0.0862745098, alpha: 1)
        static let blue                     = #colorLiteral(red: 0.09019607843, green: 0.6039215686, blue: 0.8705882353, alpha: 1)
        static let cyan                     = #colorLiteral(red: 0.06666666667, green: 0.7294117647, blue: 0.6117647059, alpha: 1)
        static let orange                   = #colorLiteral(red: 0.9843137255, green: 0.5215686275, blue: 0.1843137255, alpha: 1)
    }
}

