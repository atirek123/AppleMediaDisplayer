//
//  AnimatableView.swift
//  SellMyStock
//
//  Created by Atirek Sharma on 18/12/18.
//  Copyright © 2018 Atirek Sharma. All rights reserved.
//

import UIKit

@IBDesignable
class AnimatableView: UIView {

  

    
    @IBInspectable var selectedColor:UIColor = .white{
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadow: Bool {
        get {
            return true
        } set {
            layer.masksToBounds = false
            layer.shadowOffset = CGSize.zero;
            layer.shadowRadius = 2;
            layer.shadowOpacity = 0.3;
            layer.shadowColor = UIColor.white.cgColor
            backgroundColor = UIColor.white
        }
    }
    
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var maskToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set {
            self.layer.masksToBounds = newValue
        }
    }
}
