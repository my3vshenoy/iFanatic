//
//  LoginController.swift
//  Auber
//
//  Created by My3 Shenoy on 3/21/20.
//  Copyright © 2020 My3 Shenoy. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Enums
    private enum Constants {
        static let title = "AUBER"
        static let titleFontSize: CGFloat = 36
        static let titleFontName = "Avenir-Light"
        
        static let emailPlaceHolder = "Email"
        static let emailTextFieldHeight: CGFloat = 60
        
        static let imageViewForTextFieldDimensions: CGFloat = 24
        static let imageViewOpacity: CGFloat = 0.87
        static let separatorHeight: CGFloat = 0.75
        
        static let eight: CGFloat = 8
        static let sixteen: CGFloat = 16
        
        static let topPadding: CGFloat = 40
        static let backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1.0)
    }
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        // Creating a closure that returns a UILabel() object
        let label = UILabel()
        label.text = Constants.title
        label.textColor = .white
        label.font = UIFont(name: Constants.titleFontName, size: Constants.titleFontSize)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView()
        
        // Image View Set Up
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_mail_outline_white_2x")
        imageView.alpha = Constants.imageViewOpacity
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor,
                         paddingLeft: Constants.sixteen,
                         width: Constants.imageViewForTextFieldDimensions,
                         height: Constants.imageViewForTextFieldDimensions)
        
        // Email textfield set up
        view.addSubview(emailTextField)
        emailTextField.anchor(right: view.rightAnchor,
                              left: imageView.rightAnchor,
                              bottom: view.bottomAnchor,
                              paddingBottom: Constants.eight,
                              paddingLeft: Constants.eight)
        emailTextField.centerY(inView: view)
        
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
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: Constants.sixteen)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.attributedPlaceholder = NSAttributedString(string: Constants.emailPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        setUpSubViews()
    }
}

private extension LoginController {
    func setUpSubViews() {
        view.addSubview(titleLabel)
        
        // Title Label Configuration
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: Constants.topPadding)
        titleLabel.centerX(inView: view)
        
        // Email Container
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingLeft: Constants.sixteen, paddingRight: Constants.sixteen, height: Constants.emailTextFieldHeight)
        emailContainerView.centerX(inView: view)
    }
}
