//
//  Constants.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation

//MARK: URLs
let BASE_URL: String = "https://shackslack.herokuapp.com/v1"
let URL_REGISTER: String = BASE_URL + "/account/register"
let URL_USER_LOGIN: String = BASE_URL + "/account/login"
let URL_USER_ADD: String = BASE_URL + "/user/add"
let URL_USER_BY_EMAIL = BASE_URL + "/user/byEmail/"

//MARK: Headers
let HEADER = ["Content-Type": "application/json; charset=utf-8"]
let BEARER_HEADER = ["Authorization": "Bearer \(AuthService.instance.authToken)", "Content-Type": "application/json; charset=utf-8"]


//MARK: Aliases
typealias CompletionHandler = (_ Success:Bool) -> () //Created an alias for a Closure

//MARK: Segues
let TO_LOGIN:String = "toLogin"
let TO_CREATE_NEW_ACCOUNT = "toCreateNewAccount"
let UNWIND = "unwindToChannel"
let TO_CHOOSE_AVATAR = "toChooseAvatar"


//MARK: UserDefaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//MARK: Notification Constants
let NOTIF_USER_DATA_CHANGED = Notification.Name("NotifUserDataChanged")

//MARK: Colors
let PLACEHOLDER_COLOR_PURPLE = #colorLiteral(red: 0.1960784314, green: 0.2618983388, blue: 0.7153298259, alpha: 0.5)


