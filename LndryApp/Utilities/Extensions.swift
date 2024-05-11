//
//  Extensions.swift
//  LndryApp
//
//  Created by Muaaz Ahmed on 11/05/2024.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundAllCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    //to handle tab actions
    private struct OnClickHolder {
        static var _closure:()->() = {}
    }
    
    private var onClickClosure: () -> () {
        get { return OnClickHolder._closure }
        set { OnClickHolder._closure = newValue }
    }
    
    
    func onClick(target: Any, _ selector: Selector) {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(tap)
    }
    
    func addTap(closure: @escaping ()->()) {
        self.onClickClosure = closure
        
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClickAction))
        addGestureRecognizer(tap)
    }
    
    @objc private func onClickAction() {
        onClickClosure()
    }
    
    func addBorderWithShadow(cornerRadius: CGFloat = 0.0,
                             borderWidth: CGFloat = 1.0,
                             borderColor: UIColor = .black,
                             shadowColor: UIColor = .black,
                             shadowOpacity: Float = 0.5,
                             shadowOffset: CGSize = CGSize(width: 0, height: 2),
                             shadowRadius: CGFloat = 4.0) {
        // Apply border
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        
        // Apply shadow
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        
        // Ensure that masksToBounds is false so that the shadow is visible
        self.layer.masksToBounds = false
    }
}

