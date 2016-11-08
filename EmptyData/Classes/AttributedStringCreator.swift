//
//  AttributedStringCreator.swift
//  oirp
//
//  Created by Daniel on 04.11.2016.
//
//

import Foundation
import UIKit


class AttributedStringCreator: NSObject {
    private var text: String!
    private var attributed = NSMutableAttributedString()
    private var attributes = [String : AnyObject]()
    private var paragraphStyle = NSMutableParagraphStyle()
    
    
    override init() {
        super.init()
        
        self.text = ""
    }
    
    init(text: String) {
        self.text = text
        
        self.paragraphStyle.alignment = NSTextAlignment.Natural
        self.attributed = NSMutableAttributedString(string: self.text)
    }
    
    
    //TODO: dodać więcej atrybutów (=metod)
    func with(alignment alignment: NSTextAlignment) -> AttributedStringCreator {
        self.paragraphStyle.alignment = alignment
        attributes[NSParagraphStyleAttributeName] = self.paragraphStyle
        return self
    }
    
    func with(font uiFont: UIFont) -> AttributedStringCreator {
        attributes[NSFontAttributeName] = uiFont
        return self
    }
    
    func with(fontName name: String, size: CGFloat) -> AttributedStringCreator {
        let font = UIFont(name: name, size: size)
        
        
        if font == nil {
            debugPrint("ERROR when load font!")
            return self
        }
        attributes[NSFontAttributeName] = font!
        return self
    }
    
    func underline() -> AttributedStringCreator {
        attributes[NSUnderlineStyleAttributeName] = NSUnderlineStyle.StyleSingle.rawValue
        return self
    }
    
    func with(color uiColor: UIColor) -> AttributedStringCreator {
        attributes[NSForegroundColorAttributeName] = uiColor
        return self
    }
    
    func addNewLine() -> AttributedStringCreator {
        self.text = self.text + "\n"
        return self
    }
    
    func create() -> NSMutableAttributedString {
        self.attributed = NSMutableAttributedString(string: self.text, attributes: self.attributes)
        return self.attributed
    }
    
    static func merge(listOfAttributedString list: [NSMutableAttributedString]) -> NSMutableAttributedString {
        let merged = NSMutableAttributedString()
        for elem in list {
            merged.appendAttributedString(elem)
        }
        return merged
    }
}
