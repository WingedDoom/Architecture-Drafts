//
//  ContactsView.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import UIKit

class СontactsView: UIView {
    @IBOutlet var contactsTableView: UITableView!
    @IBOutlet var contactsCountLabel: UILabel!
    
    var contacts = [ContactsViewConfig]()
    
    func configure(data: [ContactsViewConfig]) {
        self.contacts = data
        self.contactsCountLabel.text = "\(contacts.count) контактов"
    }
    
    func configureSubviews() {
        contactsTableView.rowHeight = UITableViewAutomaticDimension
        contactsTableView.estimatedRowHeight = 50
        contactsTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
