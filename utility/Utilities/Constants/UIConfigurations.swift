//
//  UIConfigurations.swift
//  utility
//
//  Created by Ahmed Iqbal on 5/28/22.
//

import UIKit

@objc class UIConfiguration :NSObject {

    // MARK: Theme Colors
    static let WhiteColor = UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    static let DarkGreyColor = UIColor(red: 0.34, green: 0.38, blue: 0.40, alpha: 1.00)
    static let ThemeVeryDarkSeaGreen = UIColor.init(red: 1/255, green: 46/255, blue: 64/255, alpha: 1.00)
    static let ThemeDarkSeaGreen = UIColor.init(red: 2/255, green: 81/255, blue: 89/255, alpha: 1.00)
    static let ThemeLightSeaGreen = UIColor.init(red: 3/255, green: 166/255, blue: 150/255, alpha: 1.00)
    static let ThemeMediumSeaGreen = UIColor.init(red: 3/255, green: 140/255, blue: 140/255, alpha: 1.00)
    static let ThemeYellow = UIColor.init(red: 242/255, green: 135/255, blue: 5/255, alpha: 1.00)
    
    static let ProgressIndicatorGreen = UIColor.init(red: 135/255, green: 211/255, blue: 83/255, alpha: 1.0)
    static let ProgressIndicatorOrange = UIColor.init(red: 254/255, green: 194/255, blue: 45/255, alpha: 1.0)
    static let ProgressIndicatorRed = UIColor.init(red: 237/255, green: 81/255, blue: 73/255, alpha: 1.0)
    static let ErrorColor = UIColor.red

    //MARK: Font Names
    static let UIFONTAPPREGULAR:String = "CaviarDreams"
    static let UIFONTAPPITALIC:String = "CaviarDreams_Italic"
    static let UIFONTAPPBOLD:String = "CaviarDreams_Bold"
    static let UIFONTAPPBOLDITALIC:String = "CaviarDreams_Italic"
    
    //MARK: Font Sizes
    static let kFontSizeHeading0 : CGFloat = 30.0
    static let kFontSizeHeading1 : CGFloat = 24.0
    static let kFontSizeHeading2 : CGFloat = 22.0
    static let kFontSizeHeading3 : CGFloat = 20.0
    static let kFontSizeHeading4 : CGFloat = 18.0
    static let kFontSizeLarge : CGFloat = 16.0
    static let kFontSizeMedium : CGFloat = 14.0
    static let kFontSizeSmall : CGFloat = 12.0
    static let kFontSizeSmallLittle : CGFloat = 10.0
    static let kFontSizeExtraSmall : CGFloat = 9.0

    //MARK: Font Getters
    class func getUIFONTAPPREGULAR() -> String {
        return UIConfiguration.UIFONTAPPREGULAR
    }
    
    class func getUIFONTAPPBOLD() -> String {
        return UIConfiguration.UIFONTAPPBOLD
    }
    
    class func getUIFONTAPPITALIC() -> String {
        return UIConfiguration.UIFONTAPPITALIC
    }
    
    class func getUIFONTAPPBOLDITALIC() -> String {
        return UIConfiguration.UIFONTAPPBOLDITALIC
    }
    
    // MARK: GET UIAPP FONT
    class func getUIFONTAPPREGULAR( sizeFont: CGFloat) -> UIFont {
        return UIFont(name: UIConfiguration.getUIFONTAPPREGULAR(), size: sizeFont)!
    }
    
    class func getUIFONTAPPITALIC( sizeFont: CGFloat) -> UIFont {
        return UIFont(name: UIConfiguration.getUIFONTAPPITALIC(), size: sizeFont)!
    }
    
    class func getUIFONTBOLD( sizeFont: CGFloat) -> UIFont {
        return UIFont(name: UIConfiguration.getUIFONTAPPBOLD(), size: sizeFont)!
    }
    
    class func getUIFONTITALIC( sizeFont: CGFloat) -> UIFont {
        return UIFont(name: UIConfiguration.getUIFONTAPPITALIC(), size: sizeFont)!
    }
        
    static let IPHONE5_FRAME = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 320, height: 568))
    static let IPHONE4_FRAME = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 320, height: 480))
}
