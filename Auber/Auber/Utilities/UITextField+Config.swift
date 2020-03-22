//
//  UITextField+Config.swift
//  Auber
//
//  Created by My3 Shenoy on 3/22/20.
//  Copyright © 2020 My3 Shenoy. All rights reserved.
//

import UIKit

extension UITextField {
    
    private enum Constants {
        static let sixteen: CGFloat = 16
    }
    
    func  textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: Constants.sixteen)
        textField.textColor = .white
        textField.isSecureTextEntry = isSecureTextEntry
        textField.keyboardAppearance = .dark
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }
}
