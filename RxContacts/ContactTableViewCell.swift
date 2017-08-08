//
//  ContactTableViewCell.swift
//  RxContacts
//
//  Created by Bryan A Bolivar M on 8/7/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ContactTableViewCell: UITableViewCell {
    var contact = Variable<ContactViewModel?>(nil)
    fileprivate let bag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()

        contact.asObservable()
            .map { $0?.fullName }
            .bind(to: textLabel!.rx.text)
            .disposed(by: bag)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
