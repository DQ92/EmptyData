//
//  EmptyDataProvider.swift
//  oirp
//
//  Created by Daniel on 04.11.2016.
//
//

import Foundation
import UIKit

protocol EmptyDataProvider {
    var bgColor: UIColor {get set}
    var title: NSMutableAttributedString {get set}
    var message: NSMutableAttributedString {get set}
    
    var button: UIButton? {get set}
    var image: UIImage? {get set}
    var imageViewSize: CGSize? {get set}
}



struct NoExists: EmptyDataProvider {
    var bgColor: UIColor = UIColor(red: 53/255, green: 57/255, blue: 67/255, alpha: 0.99)
    
    var title = AttributedStringCreator(text: "It seems that this place is not on planet Earth")
        .with(fontName: "HelveticaNeue-Italic", size: 18.0)
        .with(color: .whiteColor())
        .with(alignment: .Center)
        .addNewLine()
        .create()
    
    var message = AttributedStringCreator(text: "")
        .with(fontName: "HelveticaNeue-Thin", size: 16.0)
        .with(color: .lightGrayColor())
        .with(alignment: .Center)
        .create()
    
    var image = UIImage(named: "search-shadow-500")
    var imageViewSize: CGSize? = CGSize(width: 100, height: 100)
    
    var button: UIButton? = UIButtonBuilder()
        .size(CGSize(width: 80, height: 30))
        .title("CLOSE", titleFont: UIFont(name: "HelveticaNeue", size: 16)!, titleColor: UIColor.orangeColor(), highlightedAlpha: 0.75)
        .build()
}


struct NoInternet: EmptyDataProvider {
    var bgColor: UIColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.2)
    
    var title = AttributedStringCreator(text: "No Wi-Fi detected")
        .with(fontName: "HelveticaNeue-Bold", size: 24.0)
        .with(color: .darkGrayColor())
        .with(alignment: .Center)
        .addNewLine()
        .create()
    
    var message = AttributedStringCreator(text: "Turn on Wi-Fi to establish a connection with your Google Cast device.")
        .with(fontName: "HelveticaNeue", size: 16.0)
        .with(color: .lightGrayColor())
        .with(alignment: .Center)
        .addNewLine()
        .create()
    
    var image = UIImage(named: "cloud-magnifier")
    var imageViewSize: CGSize? = CGSize(width: 150, height: 150)
    
    var button: UIButton? = UIButtonBuilder()
        .size(CGSize(width: 160, height: 30))
        .title("TURN ON Wi-Fi", titleFont: UIFont(name: "HelveticaNeue", size: 11)!, titleColor: .darkGrayColor(), highlightedAlpha: 0.9)
        .border(borderColor: .darkGrayColor(), cornerRadius: 6, borderWidth: 1.5)
        .with(image: UIImage(named: "no_Wi-Fi-100"))
        .with(backgroundColor: UIColor.whiteColor())
        .build()
}



struct NoData: EmptyDataProvider {
    var bgColor: UIColor = UIColor.clearColor()
    
    var title = AttributedStringCreator(text: "UWAGA!")
        .with(fontName: "HelveticaNeue-Bold", size: 24.0)
        .with(color: .darkGrayColor())
        .with(alignment: .Center)
        .underline()
        .addNewLine()
        .create()
    
    var message = AttributedStringCreator(text: "Brak danych. Spróbuj ponownie.")
        .with(fontName: "HelveticaNeue-Thin", size: 16.0)
        .with(color: .lightGrayColor())
        .with(alignment: .Center)
        .addNewLine()
        .create()
    
    var image = UIImage(named: "error-draw")
    var imageViewSize: CGSize? = CGSize(width: 128, height: 128)
    
    
    var button: UIButton? = UIButtonBuilder()
        .size(CGSize(width: 100, height: 28))
        .title("REFRESH", titleFont: UIFont(name: "HelveticaNeue", size: 12.0)!, titleColor: UIColor.whiteColor(), highlightedAlpha: 0.5)
        .border(borderColor: nil, cornerRadius: 2, borderWidth: 1)
        .with(backgroundColor: UIColor(red: 225/255, green: 73/255, blue: 73/255, alpha: 1.0))
        .build()
}


struct NoPost: EmptyDataProvider {
    var bgColor: UIColor = UIColor.whiteColor()
    
    static var color = UIColor(red: 213/255, green: 178/255, blue: 127/255, alpha: 1)
    
    var title = AttributedStringCreator(text: "Nothing to see here ;)")
        .with(fontName: "HelveticaNeue", size: 18.0)
        .with(color: UIColor.lightGrayColor())
        .with(alignment: .Center)
        .addNewLine()
        .create()
    
    var message = AttributedStringCreator(text: "")
        .with(fontName: "HelveticaNeue-Thin", size: 16.0)
        .with(color: .lightGrayColor())
        .with(alignment: .Center)
        .create()
    
    var image = UIImage(named: "post")
    var imageViewSize: CGSize? = CGSize(width: 260, height: 260)
    
    var button: UIButton? = UIButtonBuilder()
        .size(CGSize(width: 120, height: 30))
        .title("Learn more", titleFont: UIFont(name: "HelveticaNeue", size: 16)!, titleColor: color, highlightedAlpha: 0.75)
        .with(backgroundColor: UIColor.whiteColor())
        .border(borderColor: .lightGrayColor(), cornerRadius: 1.5, borderWidth: 1)
        .shadow(UIColor.darkGrayColor(), offset: CGSize(width: 0, height: 1), radius: 2.0, opacity: 0.4)
        .build()
}


struct NoSetup: EmptyDataProvider {
    var bgColor: UIColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
    
    var title = AttributedStringCreator(text: "Your followed shows will live here.")
        .with(fontName: "HelveticaNeue", size: 18.0)
        .with(color: .lightGrayColor())
        .with(alignment: .Center)
        .addNewLine()
        .addNewLine()
        .create()
    
    var message = AttributedStringCreator(text: "Your're not following any show yet. \nTake a few minutes to set thinhgs up.")
        .with(fontName: "HelveticaNeue-Thin", size: 16.0)
        .with(color: .lightGrayColor())
        .with(alignment: .Center)
        .addNewLine()
        .create()
    
    var image = UIImage(named: "search-500")
    var imageViewSize: CGSize? = CGSize(width: 150, height: 150)
    
    var button: UIButton? = UIButtonBuilder()
        .size(CGSize(width: 100, height: 30))
        .title("Setup", titleFont: UIFont(name: "HelveticaNeue-Thin", size: 16)!, titleColor: .lightGrayColor(), highlightedAlpha: 0.75)
        .border(borderColor: .lightGrayColor(), cornerRadius: 15, borderWidth: 1)
        .build()
}


