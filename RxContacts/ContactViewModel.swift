//
//  ContactViewModel.swift
//  RxContacts
//
//  Created by Bryan A Bolivar M on 8/7/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

struct ContactViewModel {
    let contact: Contact!

    init(contact: Contact) {
        self.contact = contact
    }

    var fullName: String {
        guard let lastName = contact.lastName else {
            return contact.name
        }
        return contact.name + " " + lastName
    }
}
