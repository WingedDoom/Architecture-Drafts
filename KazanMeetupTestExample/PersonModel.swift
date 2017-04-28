//
//  PersonModel.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import UIKit

class PersonModel: NSObject {
    let name: String
    let birthDate: Date
    
    init(name: String, birthDate: Date) {
        self.name = name
        self.birthDate = birthDate
    }
}
