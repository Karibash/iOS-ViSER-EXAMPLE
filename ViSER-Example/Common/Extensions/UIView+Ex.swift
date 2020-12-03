//
//  UIView+Ex.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/03.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

}
