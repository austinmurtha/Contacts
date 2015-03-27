//
//  Contacts.swift
//  Contacts
//
//  Created by Austin Murtha on 3/27/15.
//  Copyright (c) 2015 AustinMurtha. All rights reserved.
//

import UIKit

class Contacts: NSObject {
    var firstName: String = ""
    var lastName: String = ""
    var cellPhoneNumber: String = ""
    var workPhoneNumber: Int = 0
    var country: String = ""

    
    init(firstName:String, lastName: String, cellPhoneNumber: String){
        let firstName = self.firstName
        let lastName = self.lastName
        let cellPhoneNumber = self.cellPhoneNumber
        super.init()
    }
    
    
    
}

