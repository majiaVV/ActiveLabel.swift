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
        let payPlaceholder = "智士软件通过Sociax社会化平台，致力于成为企业2.0及社会化软件领域的领导者。我们的项目始于 2008年，由一群80后的创业团队，基于国内外先进的SNS及Web2.0技术理念，以Think工作室的形式，首先推出开源社区平台 --ThinkSNS，并在个人、企业和非营利组织中快速传播，队伍不断壮大。"
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
        
        /**下面的 paragraphStyle 应该不会影响效果。暂时注释掉
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.paragraphSpacing = 3
        paragraphStyle.headIndent = 0.0001
        paragraphStyle.tailIndent = -0.0001
        payAttri.addAttributes([NSShadowAttributeName: shadow, NSStrokeWidthAttributeName: 1, NSStrokeColorAttributeName: UIColor.white, NSParagraphStyleAttributeName: paragraphStyle], range:range)
        */
        payAttri.addAttributes([NSShadowAttributeName: shadow, NSStrokeWidthAttributeName: 1, NSStrokeColorAttributeName: UIColor.white], range:range)
        let attributeString = self
        attributeString.append(payAttri)
        return attributeString
    }
}
