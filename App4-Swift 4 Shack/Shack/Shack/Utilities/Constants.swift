//
//  Constants.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation

//MARK: URLs
let BASE_URL: String = "https://shackslack.herokuapp.com/"
let URL_REGISTER: String = BASE_URL + "/account/register"


//MARK: Aliases
typealias CompletionHandler = (_ Success:Bool) -> () //Created an alias for a Closure

//MARK: Segues
let TO_LOGIN:String = "toLogin"
let TO_CREATE_NEW_ACCOUNT = "toCreateNewAccount"
let UNWIND = "unwindToChannel"


//MARK: UserDefaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


