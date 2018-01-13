//
//  AuthService.swift
//  Shack
//
//  Created by My3 Shenoy on 09/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    //MARK:API Functions
    func registerUser(email:String, password:String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email":lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString
            { (response) in
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error.debugDescription as Any)
                }
        }
    }
    
    
    func loginUser(email:String, password:String, completion: @escaping CompletionHandler ){
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email":lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
            {(response) in
                if response.result.error == nil{
                    guard let data = response.data else { return }
                    if let json = try? JSON(data: data){
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    
                    self.isLoggedIn = true
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as! String)
                }
        }
    }
    }
    func createUser(name: String, email: String, avatarName: String, avatarColor: String,  completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "name": name,
            "email":lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = ["Authorization": "Bearer \(AuthService.instance.authToken)", "Content-Type": "application/json; charset=utf-8"]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON
            { (response) in
                if response.result.error == nil{
                    guard let responseData = response.data else {return}
                    if let json = try? JSON(data: responseData){
                    let id = json["_id"].stringValue
                    let name = json["name"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let color = json["avatarColor"].stringValue
                    let email = json["email"].stringValue
                        
                    UserDataService.instance.setUserData(id: id, avatarColor: color, avatarName: avatarName, email: email, name: name)
                    }
                    
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error.debugDescription as Any)
                }
        }
    }
}
