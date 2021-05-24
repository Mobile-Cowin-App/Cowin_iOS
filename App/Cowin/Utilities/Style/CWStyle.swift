//
//  CWStyle.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

extension UIFont {
    
    class func getIconFont(size: CGFloat) -> UIFont? {
        return UIFont(name: "icomoon", size: size)
    }
    
    class func getAvatarLabelFont(size: CGFloat = 14.0) -> UIFont {
        return self.getApplicationFont(size, .semibold)
    }
    
    class func getApplicationItalicFont(size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
    }
    
    class func getApplicationFont(_ size: CGFloat = 12.0,
                                  _ weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

enum CWFontStyles {
    
    case heading, primary(UIFont.Weight), secondary(UIFont.Weight), teritary(UIFont.Weight), quaternary(UIFont.Weight), quinary(UIFont.Weight)

    var font: UIFont {
        switch self {
        case .heading:
            return UIFont.getApplicationFont(CWFontSize.heading.rawValue, .heavy)
            
        case .primary(let weight):
            return UIFont.getApplicationFont(CWFontSize.primary.rawValue, weight)
            
        case .secondary(let weight):
            return UIFont.getApplicationFont(CWFontSize.secondary.rawValue, weight)
            
        case .teritary(let weight):
            return UIFont.getApplicationFont(CWFontSize.teritary.rawValue, weight)
            
        case .quaternary(let weight):
            return UIFont.getApplicationFont(CWFontSize.quaternary.rawValue, weight)
            
        case .quinary(let weight):
            return UIFont.getApplicationFont(CWFontSize.quinary.rawValue, weight)
        }
    }
}

enum CWFontSize: CGFloat {
    
    case heading = 22.0
    
    case primary = 16.0
    
    case secondary = 14.0
    
    case teritary = 12.0
    
    case quaternary = 10.0
    
    case quinary = 8.0
}

enum CWTextColorStyles {
    
    case primary, secondary, teritary, appTheme, custom
    
    var color: UIColor? {
        switch self {
        case .primary:
            return CWStyle.Text.primary
            
        case .secondary:
            return CWStyle.Text.secondary
            
        case .teritary:
            return #colorLiteral(red: 0.3882352941, green: 0.4352941176, blue: 0.4941176471, alpha: 1)
            
        case .appTheme:
            return CWStyle.Static.appTheme
            
        case .custom:
            return .clear
        }
    }
}


extension UIView {
    
    func applyTextAttributes(font fontStyle: CWFontStyles, withColor colorStyle: CWTextColorStyles) -> Void {
        
        self.applyAttributes(font: fontStyle.font, textColor: colorStyle.color)
    }
    
    
    func applyIconTextAttributes(fontSize size: CGFloat, withColor colorStyle: CWTextColorStyles) -> Void {
        
        if let iconFont = UIFont.getIconFont(size: size) {
            self.applyAttributes(font: iconFont, textColor: colorStyle.color)
        }
    }
    
    private func applyAttributes(attributedText: NSMutableAttributedString) -> Void {
       
        if let label = self as? UILabel {
            
            label.attributedText = attributedText
            
        } else if let button = self as? UIButton {
            
            button.setAttributedTitle(attributedText, for: .normal)
            
        } else if let textView = self as? UITextView {
            
            textView.attributedText = attributedText
        }
    }

    private func applyAttributes(font: UIFont, textColor: UIColor?) -> Void {
        
        if let label = self as? UILabel {
            
            label.textColor = textColor
            label.font = font
            
        } else if let button = self as? UIButton {
            
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = font
            
        } else if let textField = self as? UITextField {
            
            textField.textColor = textColor
            textField.tintColor = textColor
            textField.font = font

        } else if let textView = self as? UITextView {
            
            textView.textColor = textColor
            textView.tintColor = textColor
            textView.font = font
        }
    }
}
