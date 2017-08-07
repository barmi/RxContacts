//
//  Contact.swift
//  RxContacts
//
//  Created by Bryan A Bolivar M on 8/7/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

struct Contact {
    var name: String
    var lastName: String?
    var birthDate: Date?
    var phoneNumber: String?
    var zipCode: Int?

    init(name: String,
         lastName: String? = nil,
         birthDate: Date? = nil,
         phoneNumber: String? = nil,
         zipCode: Int? = nil) {

        if name == "" {
            self.name = "NoName"
        } else {
            self.name = name
        }

        self.lastName = lastName
        self.birthDate = birthDate
        self.phoneNumber = phoneNumber
        self.zipCode = zipCode
    }
}
