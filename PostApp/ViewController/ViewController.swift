//
//  ViewController.swift
//  PostApp
//
//  Created by Daniel Suskevic on 27/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import TwitterKit

class ViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var textField: UITextField!
    
    var readPermissionsArray : [String] = ["user_about_me", "user_posts"]
    var writePermissionsArray : [String] = ["publish_actions"]
    var textToPost : String = ""
    
    override func viewDidLoad() {
    }
    
    func setPermissions() {
        //loginButton.readPermissions = readPermissionsArray // dont need in this case
        loginButton.publishPermissions = writePermissionsArray
    }
    
    @IBAction func reloadButtonTapped(_ sender: UIButton) {
        executeActions()
    }
    
    func executeActions() {
        textField.resignFirstResponder()
        readTextField()
        textField.text = ""
        setPermissions()
        PostToFB.postFB(textToPost: textToPost)
    }
    
    func readTextField() {
        if textField.text != "" {
            textToPost = textField.text!
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }
}
