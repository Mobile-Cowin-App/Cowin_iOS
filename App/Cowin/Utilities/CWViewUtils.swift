//
//  CWViewUtils.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit

extension UIView {
    
    @discardableResult public func g_pin(on type1: NSLayoutConstraint.Attribute,
                                         view: UIView? = nil, on type2: NSLayoutConstraint.Attribute? = nil,
                                         constant: CGFloat = 0,
                                         priority: Float? = nil) -> NSLayoutConstraint? {
        guard let view = view ?? superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let type2 = type2 ?? type1
        let constraint = NSLayoutConstraint(item: self, attribute: type1,
                                            relatedBy: .equal,
                                            toItem: view, attribute: type2,
                                            multiplier: 1, constant: constant)
        if let priority = priority {
            constraint.priority = UILayoutPriority.init(priority)
        }
        
        constraint.isActive = true
        
        return constraint
    }
    
    public func g_pinEdges(view: UIView? = nil) {
        g_pin(on: .top, view: view)
        g_pin(on: .bottom, view: view)
        g_pin(on: .left, view: view)
        g_pin(on: .right, view: view)
    }
    
    public func g_pin(size: CGSize) {
        g_pin(width: size.width)
        g_pin(height: size.height)
    }
    
    public func g_pin(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width))
    }
    
    @discardableResult public func g_pin(height: CGFloat) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
        addConstraint(constraint)
        return constraint
    }
    
    public func g_pin(greaterThanHeight height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height))
    }
    
    public func g_pinHorizontally(view: UIView? = nil, padding: CGFloat) {
        g_pin(on: .left, view: view, constant: padding)
        g_pin(on: .right, view: view, constant: -padding)
    }
    
    public func g_pinUpward(view: UIView? = nil) {
        g_pin(on: .top, view: view)
        g_pin(on: .left, view: view)
        g_pin(on: .right, view: view)
    }
    
    public func g_pinDownward(view: UIView? = nil) {
        g_pin(on: .bottom, view: view)
        g_pin(on: .left, view: view)
        g_pin(on: .right, view: view)
    }
    
    public func g_pinCenter(view: UIView? = nil) {
        g_pin(on: .centerX, view: view)
        g_pin(on: .centerY, view: view)
    }
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    @discardableResult public func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

extension UIView {
    public class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        else { fatalError("missing expected nib named: \(name)") }
        guard
            /// we're using `first` here because compact map chokes compiler on
            /// optimized release, so you can't use two views in one nib if you wanted to
            /// and are now looking at this
            let view = nib.first as? Self
        else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
    
    
    internal func addShadowView(width:CGFloat=0.2, height:CGFloat=0.2, Opacidade:Float=0.7, maskToBounds:Bool=false, radius:CGFloat=0.5){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
    
    
}

internal extension UIViewController {
    func appendWithNavigation() -> UINavigationController {
        let controller =  UINavigationController(rootViewController: self)
        return controller
    }
}
