//
//  UIView+ContainerViews.swift
//  Auber
//
//  Created by My3 Shenoy on 3/22/20.
//  Copyright © 2020 My3 Shenoy. All rights reserved.
//

import UIKit

extension UIView {
    private enum Constants {
        static let imageViewOpacity: CGFloat = 0.87
        static let imageViewForTextFieldDimensions: CGFloat = 24
        static let separatorHeight: CGFloat = 0.75
        static let eight: CGFloat = 8
        static let sixteen: CGFloat = 16
    }
    
    func  inputContainerView(forImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        
        // Image View Set Up
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = Constants.imageViewOpacity
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor,
                         paddingLeft: Constants.sixteen,
                         width: Constants.imageViewForTextFieldDimensions,
                         height: Constants.imageViewForTextFieldDimensions)
        
        // Email textfield set up
        view.addSubview(textField)
        textField.anchor(right: view.rightAnchor,
                              left: imageView.rightAnchor,
                              bottom: view.bottomAnchor,
                              paddingBottom: Constants.eight,
                              paddingLeft: Constants.eight)
        textField.centerY(inView: view)
        
        // Separator View Setup: The line below the textField
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(right: view.rightAnchor,
                             left: view.leftAnchor,
                             bottom: view.bottomAnchor,
                             paddingLeft: Constants.eight,
                             height: Constants.separatorHeight)
        return view
    }
}
