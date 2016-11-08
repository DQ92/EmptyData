//
//  UIButtonBuilder.swift
//  oirp
//
//  Created by Daniel on 04.11.2016.
//
//

import Foundation
import UIKit


class UIButtonBuilder: NSObject {
    private var button = UIButton()
    private let defaultSize = CGSize(width: 280, height: 45)
    
    
    override init() {
        super.init()
        
        button.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: defaultSize)
    }
    
    func size(size: CGSize) -> UIButtonBuilder{
        button.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        return self
    }
    
    func with(backgroundColor bgColor: UIColor?) -> UIButtonBuilder {
        if let buttonBgColor = bgColor {
            button.backgroundColor = buttonBgColor
        } else {
            button.backgroundColor = UIColor.clearColor()
        }
        return self
    }
    
    
    func with(image img: UIImage?, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8) ) -> UIButtonBuilder {
        button.imageView?.contentMode = .ScaleAspectFit
        button.setImage(img, forState: .Normal)
        button.imageEdgeInsets = insets
        
        return self
    }
    
    func title(title: String, titleColor tc: UIColor?, highlightedAlpha alpha: CGFloat) -> UIButtonBuilder{
        button.setTitle(title, forState: .Normal)
        
        if let titleColor = tc {
            let titleHighlighted = titleColor.colorWithAlphaComponent(alpha)
            button.setTitleColor(titleColor, forState: .Normal)
            button.setTitleColor(titleHighlighted, forState: .Highlighted)
        }
        return self
    }
    
    func title(title: String, titleFont: UIFont, titleColor tc: UIColor?, highlightedAlpha alpha: CGFloat) -> UIButtonBuilder{
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = titleFont
        
        if let titleColor = tc {
            let titleHighlighted = titleColor.colorWithAlphaComponent(alpha)
            button.setTitleColor(titleColor, forState: .Normal)
            button.setTitleColor(titleHighlighted, forState: .Highlighted)
        }
        
        return self
    }
    
    func border(borderColor borderColor: UIColor?, cornerRadius: CGFloat?, borderWidth: CGFloat?) -> UIButtonBuilder{
        button.layer.cornerRadius = cornerRadius ?? 0
        button.layer.borderColor = borderColor?.CGColor ?? UIColor.clearColor().CGColor
        button.layer.borderWidth = borderWidth ?? 0
        return self
    }
    
    func shadow(color: UIColor, offset: CGSize, radius: CGFloat, opacity: CGFloat) -> UIButtonBuilder {
        button.layer.shadowColor = color.CGColor
        button.layer.shadowOffset = offset
        button.layer.shadowRadius = radius
        button.layer.shadowOpacity = Float(opacity)
        //        button.layer.masksToBounds = false
        return self
    }
    
    func build() -> UIButton {
        return button
    }
}
