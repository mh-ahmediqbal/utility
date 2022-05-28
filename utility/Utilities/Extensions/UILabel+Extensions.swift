//
//  UILabel+Extensions.swift
//  utility
//
//  Created by Ahmed Iqbal on 5/28/22.
//

import Foundation

import UIKit

extension UILabel {
    func setupFormLabel(borderColor: UIColor = .clear, borderWidth: CGFloat = 0, textColor: UIColor = UIConfiguration.ThemeDarkSeaGreen, tintColor: UIColor = UIConfiguration.ThemeDarkSeaGreen, font: UIFont = UIConfiguration.getUIFONTAPPREGULAR(sizeFont: UIConfiguration.kFontSizeMedium)) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.setupTextAppearance(textColor: textColor, tintColor: tintColor, font: font)
    }
    
    func setupTextAppearance(textColor: UIColor = UIConfiguration.ThemeDarkSeaGreen, tintColor: UIColor = UIConfiguration.ThemeDarkSeaGreen, font: UIFont = UIConfiguration.getUIFONTAPPREGULAR(sizeFont: UIConfiguration.kFontSizeMedium)) {
        self.textColor = textColor
        self.tintColor = tintColor
        self.font = font
    }
    
    func setupSectionHeaderAppearance(textColor: UIColor = UIConfiguration.ThemeDarkSeaGreen, tintColor: UIColor = UIConfiguration.ThemeDarkSeaGreen, font: UIFont = UIFont(name: UIConfiguration.getUIFONTAPPBOLD(), size: UIConfiguration.kFontSizeLarge) ?? UIFont.boldSystemFont(ofSize: 16.0)) {
        self.setupTextAppearance(textColor: textColor, tintColor: tintColor)
        self.font = font
    }
    
    func addTrailing(with trailingText: String, moreText: String, moreTextFont: UIFont, moreTextColor: UIColor) {
            let readMoreText: String = trailingText + moreText

            let lengthForVisibleString: Int = self.visibleTextLength
            let mutableString: String = self.text!
            let trimmedString: String? = (mutableString as NSString).replacingCharacters(in: NSRange(location: lengthForVisibleString, length: ((self.text?.count)! - lengthForVisibleString)), with: "")
            let readMoreLength: Int = (readMoreText.count)
            let trimmedForReadMore: String = (trimmedString! as NSString).replacingCharacters(in: NSRange(location: ((trimmedString?.count ?? 0) - readMoreLength), length: readMoreLength), with: "") + trailingText
        let answerAttributed = NSMutableAttributedString(string: trimmedForReadMore, attributes: [NSAttributedString.Key.font: self.font ?? UIFont.systemFont(ofSize: 20)])
        let readMoreAttributed = NSMutableAttributedString(string: moreText, attributes: [NSAttributedString.Key.font: moreTextFont, NSAttributedString.Key.foregroundColor: moreTextColor])
            answerAttributed.append(readMoreAttributed)
            self.attributedText = answerAttributed
        }

        var visibleTextLength: Int {
            let font: UIFont = self.font
            let mode: NSLineBreakMode = self.lineBreakMode
            let labelWidth: CGFloat = self.frame.size.width
            let labelHeight: CGFloat = self.frame.size.height
            let sizeConstraint = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)

            let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: font]
            let attributedText = NSAttributedString(string: self.text!, attributes: attributes as? [NSAttributedString.Key : Any])
            let boundingRect: CGRect = attributedText.boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, context: nil)

            if boundingRect.size.height > labelHeight {
                var index: Int = 0
                var prev: Int = 0
                let characterSet = CharacterSet.whitespacesAndNewlines
                repeat {
                    prev = index
                    if mode == NSLineBreakMode.byCharWrapping {
                        index += 1
                    } else {
                        index = (self.text! as NSString).rangeOfCharacter(from: characterSet, options: [], range: NSRange(location: index + 1, length: self.text!.count - index - 1)).location
                    }
                } while index != NSNotFound && index < self.text!.count && (self.text! as NSString).substring(to: index).boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, attributes: attributes as? [NSAttributedString.Key : Any], context: nil).size.height <= labelHeight
                return prev
            }
            return self.text!.count
        }
}
