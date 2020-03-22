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
        static let emailImageName = "ic_mail_outline_white_2x"
        static let passwordPlaceHolder = "Password"
        static let credentialsTextFieldHeight: CGFloat = 60
        
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
        return UIView().inputContainerView(forImage: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    }()
    
    private let emailTextField: UITextField = {
        let view = UITextField().textField(withPlaceholder: Constants.emailPlaceHolder, isSecureTextEntry: false)
        view.heightAnchor.constraint(equalToConstant: Constants.credentialsTextFieldHeight).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        return UIView().inputContainerView(forImage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
    }()
    
    private let passwordTextField: UITextField = {
        let view = UITextField().textField(withPlaceholder: Constants.passwordPlaceHolder, isSecureTextEntry: true)
        view.heightAnchor.constraint(equalToConstant: Constants.credentialsTextFieldHeight).isActive = true
        return view
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
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: titleLabel.bottomAnchor,
                         right: view.rightAnchor,
                         left: view.leftAnchor,
                         paddingTop: Constants.sixteen,
                         paddingLeft: Constants.sixteen,
                         paddingRight: Constants.sixteen)
    }
}
