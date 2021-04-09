//
//  Uiview+extension.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/8/21.
//

import Foundation

import UIKit

extension UIView {
    
    func addShadowView() {
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5
    }
    
    func makeRoundImageView() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
}

extension UILabel {
    
    func addCharacterSpacing(kernValue: Double = 3) {
        if let labelText = text, labelText.isEmpty == false {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern,
                                          value: kernValue,
                                          range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

extension UIButton {
    
    func makeRoundRectangle() {
        self.layer.cornerRadius = 10
    }
}

extension UIImageView {
    
    func makeRoundRectangle() {
        self.layer.cornerRadius = 10
    }
    
    func makeRounded() {
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
}
