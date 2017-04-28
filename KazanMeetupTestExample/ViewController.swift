//
//  ViewController.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var personList = [PersonModel]()
    var presentablePersonList: [ViewConfig]!
    var customView: View!

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTemplateData()
        customView.contactsTableView.dataSource = self
        
        presentablePersonList = [ViewConfig]()
        for person in personList {
            presentablePersonList.append(ViewConfig(model: person))
        }
        customView.configure(data: presentablePersonList)
    }
    
    func generateTemplateData() {
        personList.append(PersonModel(name: "Ренат", birthDate: Date()))
        personList.append(PersonModel(name: "Булат", birthDate: Date()))
        personList.append(PersonModel(name: "Илья", birthDate: Date()))
        personList.append(PersonModel(name: "Никита", birthDate: Date()))
    }
    
    override func loadView() {
        let ourCustomView = View()
        
        // не кастить
        self.customView = ourCustomView
        
        self.view = ourCustomView
    }
    
    
    // MARK: - Table data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PersonTableViewCell
        
        cell.configure(config: presentablePersonList[indexPath.row])
        
        return cell
    }
}

