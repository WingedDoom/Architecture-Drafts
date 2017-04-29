//
//  ContactsViewConfig.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import Foundation

struct ContactsViewConfig {
    let name: String
    let birthDateString: String
    
    init(model: PersonModel) {
        self.name = model.name
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        birthDateString = formatter.string(for: model.birthDate)!
    }
}
