//
//  PostToFB.swift
//  PostApp
//
//  Created by Daniel Suskevic on 27/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class PostToFB {
    class func postFB(textToPost: String) {
        if ((FBSDKAccessToken.current()) != nil) {
            let request : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me/feed", parameters: ["message": textToPost], httpMethod: "POST")
            
            request.start { (connection, result, error) -> Void in
                if error == nil {
                    //print(result)
                } else {
                    print(error as Any)
                }
            }
        }
    }
}
