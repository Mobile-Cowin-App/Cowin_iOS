//
//  CWUtility.swift
//  Cowin
//
//

import Foundation
import UIKit
import CommonCrypto

internal struct CWUtility {
    
    static var authTocken: String{
        set {
            CWUserDefaultManager.saveAuthTocken(value: newValue)
        }
        get  {
            return CWUserDefaultManager.getAuthToken() ?? ""
        }
    }
    
    static func getController<T>(_ storyBoardName: String, _ identifier: String , type: T.Type) -> T {
            return UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
    }
}


public extension String {

  var sha256: String {
      let data = Data(utf8)
      var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))

      data.withUnsafeBytes { buffer in
          _ = CC_SHA256(buffer.baseAddress, CC_LONG(buffer.count), &hash)
      }

      return hash.map { String(format: "%02hhx", $0) }.joined()
  }
    
    static var makeEmpty: String {
        return ""
    }
}

extension UIView {
    
    func applyDropShadow() {
        self.applyShadow(shadowColor: UIColor.black.withAlphaComponent(0.075), shadowRadius: 6.0, shadowOpacity: 1.0)//, shadowOffset : CGSize(width: 0, height: 5))
    }
    
    func applyHomeBottomViewBorderRadius() {
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func applyHomeTopViewBorderRadius() {
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func applyHomeCellBorderRadius() {
        self.layer.cornerRadius = 10.0
    }
}
