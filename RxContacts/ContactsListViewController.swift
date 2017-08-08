//
//  ContactsListViewController.swift
//  RxContacts
//
//  Created by Bryan A Bolivar M on 8/7/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContactsListViewController: UIViewController {

    // MARK: - Properties

    fileprivate let contactCellIdentifier = "Cell"
    fileprivate let bag = DisposeBag()
    fileprivate let contacts =  Variable<[ContactViewModel]>([])
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setDemoData()
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setDemoData() {
        //** test data, remove after link with database
        let contacts = [Contact(name:"bryan"), Contact(name: "julieth")]
        var contactsVM = [ContactViewModel]()
        for c in contacts {
            contactsVM.append(ContactViewModel(contact: c))
        }

        self.contacts.value = contactsVM
    }
    // MARK: - Rx

    func configureUI() {

        contacts.asObservable()
            .bind(to: tableView.rx.items) { (tableView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: self.contactCellIdentifier,
                                                         for: indexPath) as! ContactTableViewCell
                cell.contact.value = element
                return cell
            }
            .disposed(by: bag)
    }

}
