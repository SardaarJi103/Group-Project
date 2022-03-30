//
//  Data.swift
//  Group-Project
//
//  Created by  on 2022-03-29.
//

import UIKit

class Data: NSObject {
    var id: Int?
    var firstname : String?
    
    var lastname : String?
    var email : String?
    var password : String?
    var subscribe : Int32?
    
    
    
    func initWithData(theRow i : Int, theFirstName n : String,theLastName l : String, theEmail e : String, thePassword p : String, theSubscribe s : Int32){
        
        id = i
        firstname = n
        lastname = l
        email = e
        password = p
        subscribe = s
        
    }
}
