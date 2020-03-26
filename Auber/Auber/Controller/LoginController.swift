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
        
        static let loginButtonTitle = "Login"
        static let dontHaveAnAccountButtonTitle = "Don't have an account?  "
        static let signupTitle = "Sign Up"
        
        static let sixteen: CGFloat = 16
        static let twentyFour: CGFloat = 24
        
        static let topPadding: CGFloat = 40
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.loginButtonTitle, for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .mainBlueTint
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.twentyFour)
        return button
    }()
    
    private let dontHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: Constants.dontHaveAnAccountButtonTitle,
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: Constants.sixteen),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: Constants.signupTitle,
                                                  attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: Constants.sixteen),
                                                               NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)

        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setUpSubViews()
    }
}

private extension LoginController {
    func setUpSubViews() {
        view.addSubview(titleLabel)
        
        // Title Label Configuration
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: Constants.topPadding)
        titleLabel.centerX(inView: view)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: titleLabel.bottomAnchor,
                         right: view.rightAnchor,
                         left: view.leftAnchor,
                         paddingTop: Constants.topPadding,
                         paddingLeft: Constants.sixteen,
                         paddingRight: Constants.sixteen)
        stackView.spacing = Constants.twentyFour
        view.addSubview(dontHaveAnAccountButton)
        dontHaveAnAccountButton.centerX(inView: view)
        dontHaveAnAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: Constants.twentyFour)
    }
    
    @objc func handleShowSignUp() {
        
    }
}
