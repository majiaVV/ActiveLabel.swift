//
//  StringTrimExtension.swift
//  ActiveLabel
//
//  Created by Pol Quintana on 04/09/16.
//  Copyright © 2016 Optonaut. All rights reserved.
//

import Foundation

extension String {
    
    func trim(to maximumCharacters: Int) -> String {
        return substring(to: index(startIndex, offsetBy: maximumCharacters)) + "..."
    }
}

extension String {
    func attributonString() -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
}

extension NSMutableAttributedString {
    
    /// 添加付费模糊效果
    ///
    /// - Returns: 文字
    func addFuzzyString() -> NSMutableAttributedString {
        // 1.设置占位文字
        let payPlaceholder = "年轻人记得充钱哦你以为你不充钱还能获得力量么年轻人记得充钱哦你以为你不充钱还能获得力量么充钱充钱充钱充钱充钱充钱充钱充钱充钱，充钱年轻人记得充钱哦你以为你不充钱还能获得力量么年轻人记得充钱哦你以为你不充钱还能获得力量么充钱充钱充钱充钱充钱充钱充钱充钱充钱充钱"
        //        let normalString = self
        let payAttri = NSMutableAttributedString(string: payPlaceholder)
        let range = NSRange(location: 0, length: payAttri.length)
        // 1.将 self 原有的 attributes 添加给 attributeString
        let oldAttributes = self.attributes(at: 0, effectiveRange: nil)
        //        attributeString.addAttributes(oldAttributes, range: NSRange(location: 0, length: attributeString.length))
        payAttri.addAttributes(oldAttributes, range: range)
        // 2.将需要付费的范围进行模糊
        //        let blurRange = NSRange(location: normalString.length, length: attributeString.length - normalString.length)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 6
        //        attributeString.addAttributes([NSShadowAttributeName: shadow, NSStrokeWidthAttributeName: 1, NSStrokeColorAttributeName: UIColor.white], range:blurRange)
        payAttri.addAttributes([NSShadowAttributeName: shadow, NSStrokeWidthAttributeName: 1, NSStrokeColorAttributeName: UIColor.white], range:range)
        
        let attributeString = self
        attributeString.append(payAttri)
        return attributeString
    }
}
