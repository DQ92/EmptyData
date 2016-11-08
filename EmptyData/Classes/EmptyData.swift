//
//  EmptyData.swift
//  oirp
//
//  Created by Daniel on 10.10.2016.
//
//

import Foundation
import UIKit

typealias onButtonTapped = (type: EmptyDataProvider) -> Void


//TODO: przekazywanie własnego widoku (tworzenie)

class EmptyDataView: UIView {
    
    private var parentView: UIView!
    private var contentView: UIView!
    private var shouldSetupConstraints = true
    private var type: EmptyDataProvider!
    
    var imageView: UIImageView?
    var messageTextView: UITextView!
    var button: UIButton?
    
    var imageTopMargin: CGFloat = 0
    var textViewTopMargin: CGFloat = 10
    var textViewWidthMargin: CGFloat = 12
    var buttonTopMargin: CGFloat = 24
    
    var buttonTapped: onButtonTapped?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(type: EmptyDataProvider, parentView: UIView) {
        super.init(frame: parentView.frame)
        
        self.setup(type, parentView: parentView)
    }
    
    
    func setup(type: EmptyDataProvider, parentView: UIView) {
        self.type = type
        self.parentView = parentView
        
        
        // View
        self.backgroundColor = type.bgColor
        self.userInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        // ContentView
        self.contentView = UIView(frame: self.frame)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.backgroundColor = UIColor.clearColor()
        
        
        // ImageView
        if type.image != nil && type.imageViewSize != nil {
            let imageViewFrame = CGRect(origin: CGPoint(x: 0,y: 0), size: type.imageViewSize!)
            imageView = UIImageView(frame: imageViewFrame)
            imageView!.image = type.image
            imageView!.backgroundColor = UIColor.clearColor()
            imageView!.contentMode = .ScaleAspectFit
            imageView!.translatesAutoresizingMaskIntoConstraints = false
            //        imageView!.layer.borderWidth = 3
            //        imageView!.layer.borderColor = UIColor.orangeColor().CGColor
            //        imageView.layer.cornerRadius = 80.0
            imageView!.clipsToBounds = true
            self.contentView.addSubview(imageView!)
        }
        
        
        // TextView
        messageTextView = UITextView()
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.attributedText = AttributedStringCreator.merge(listOfAttributedString: [type.title, type.message])
        messageTextView.backgroundColor = UIColor.clearColor()
        messageTextView.editable = false
        messageTextView.selectable = false
        messageTextView.scrollEnabled = false
        self.contentView.addSubview(messageTextView)
        
        
        // Button
        if let customButton = type.button {
            self.button = customButton
            button!.translatesAutoresizingMaskIntoConstraints = false
            button!.userInteractionEnabled = true
            button!.addTarget(self, action: #selector(EmptyDataView.btnTapped(_:)), forControlEvents: .TouchUpInside)
            self.contentView.addSubview(button!)
        }
        
        self.addSubview(contentView)
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            
            let textViewContentSize = calculateTextViewContentSize()
            setTextViewSize(textViewContentSize)
            let contentHeight: CGFloat = imageTopMargin + (self.imageView?.bounds.height ?? 0) + textViewTopMargin + textViewContentSize.height + buttonTopMargin + (self.button?.frame.height ?? 0)
            
            
            //view
            NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: self.parentView, attribute: .Width, multiplier: 1, constant: 0.0).active = true
            NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: self.parentView, attribute: .Height, multiplier: 1, constant: 0.0).active = true
            NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: self.parentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0).active = true
            NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: self.parentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
            
            
            //content view
            NSLayoutConstraint(item: self.contentView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: 0.0).active = true
            NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: contentHeight).active = true
            NSLayoutConstraint(item: self.contentView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0.0).active = true
            NSLayoutConstraint(item: self.contentView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
            
            
            //image
            if let imageView = self.imageView {
                let w = imageView.bounds.width
                let h = imageView.bounds.height
                NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: w).active = true
                NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: h).active = true
                NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top , multiplier: 1.0, constant: imageTopMargin).active = true
                NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
            }
            
            
            //text view
            let w = textViewContentSize.width - textViewWidthMargin
            let h = textViewContentSize.height
            if self.imageView == nil {
                NSLayoutConstraint(item: messageTextView, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top , multiplier: 1.0, constant: textViewTopMargin).active = true
            } else {
                NSLayoutConstraint(item: messageTextView, attribute: .Top, relatedBy: .Equal, toItem: self.imageView!, attribute: .BottomMargin , multiplier: 1.0, constant: textViewTopMargin).active = true
            }
            NSLayoutConstraint(item: messageTextView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: w).active = true
            NSLayoutConstraint(item: messageTextView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: h).active = true
            NSLayoutConstraint(item: messageTextView, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
            
            
            //button
            if self.button != nil {
                let w = self.button!.frame.width
                let h = self.button!.frame.height
                NSLayoutConstraint(item: self.button!, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: w).active = true
                NSLayoutConstraint(item: self.button!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: h).active = true
                NSLayoutConstraint(item: self.button!, attribute: .Top, relatedBy: .Equal, toItem: self.messageTextView, attribute: .BottomMargin , multiplier: 1.0, constant: buttonTopMargin).active = true
                NSLayoutConstraint(item: self.button!, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
            }
            
            super.updateConstraints()
        }
        super.updateConstraints()
    }
    
    private func calculateTextViewContentSize() -> CGSize {
        let size = CGSize(width: self.parentView!.bounds.width, height: self.messageTextView.bounds.size.height)
        let contentSize = self.messageTextView.sizeThatFits(size)
        return contentSize
    }
    
    private func setTextViewSize(contentSize: CGSize) {
        let textViewFrame = self.messageTextView.frame
        frame.size.height = contentSize.height
        self.messageTextView.frame = textViewFrame
    }
    
    func btnTapped(sender: UIButton) {
        buttonTapped?(type: self.type)
    }
}
