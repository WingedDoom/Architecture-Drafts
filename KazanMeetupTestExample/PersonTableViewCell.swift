//
//  PersonTableViewCell.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthDateLabel: UILabel!
    
    func configure(config: ViewConfig) {
        nameLabel.text = config.name
        birthDateLabel.text = config.birthDateString
    }
}
