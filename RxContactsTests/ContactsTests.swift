//
//  ContactsTests.swift
//  RxContacts
//
//  Created by Bryan A Bolivar M on 8/7/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import XCTest
import Nimble
@testable import RxContacts

class ContactsTests: XCTestCase {

    // MARK: Properties
    var contact: Contact!

    // MARK: - Default Methods

    override func setUp() {
        super.setUp()
         contact = Contact(name: "Bryan")
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Contact Tests

    func testContact_ShouldInitWithAName() {
        expect(self.contact.name).to(equal("Bryan"), description: "First name should be Bryan")
    }

    func testContact_MayHaveALastName() {
        contact.lastName = "Bolivar"
        expect(self.contact.lastName).to(equal("Bolivar"), description: "Last name should be Bolivar")
    }

    func testContactName_ShouldNeverBeEmpty() {
        let contactWithoutName = Contact(name:"")
        expect(contactWithoutName.name).notTo(equal(""), description: "First name should never be empty")
        expect(contactWithoutName.name).to(equal("NoName"), description: "Default name should be NoName")
    }

    func testContactViewModel_ShouldReturnFullName() {
        contact.lastName = "Bolivar"
        let contactViewModel = ContactViewModel(contact: contact)
        expect(contactViewModel.fullName).to(equal("Bryan Bolivar"), description: "Full name should be Bryan Bolivar")
    }
}
