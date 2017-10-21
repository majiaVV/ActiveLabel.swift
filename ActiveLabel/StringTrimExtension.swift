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
        return "\(self[..<index(startIndex, offsetBy: maximumCharacters)])" + "..."
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
        // 1.将 self 原有的 attributes 添加给
        let oldAttributes = self.attributes(at: 0, effectiveRange: nil)
        payAttri.addAttributes(oldAttributes, range: range)
        // 2.将需要付费的范围进行模糊
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 6
        payAttri.addAttributes([NSAttributedStringKey.shadow: shadow, NSAttributedStringKey.strokeWidth: 1, NSAttributedStringKey.strokeColor: UIColor.white], range:range)
        
        let attributeString = self
        attributeString.append(payAttri)
        return attributeString
    }
}

