//
//  ViewController.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let dataService = DataFetchService()

    var personList: [PersonModel]!
    var presentablePersonList: [ContactsViewConfig]!
    var customView: СontactsView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureData()
        configureView()
        setAppeared()
    }

    func configureData() {
        // fetch data from the service
        personList = dataService.generateTemplateData()

        // make it understandable for the view, i.e. don't let the view know about your models
        presentablePersonList = [ContactsViewConfig]()
        for person in personList {
            presentablePersonList.append(ContactsViewConfig(model: person))
        }

        // pass it to the view
        customView.configure(data: presentablePersonList)
    }

    func configureView() {
        customView.contactsTableView.dataSource = self
    }
    
    override func loadView() {
        // If I didn't use storyboards, I would use this method to set the view property to my custom view.
//        let ourCustomView = СontactsView()
//        view = ourCustomView
        
        // But I use storyboards, so it has been set to custom view already.
        super.loadView()
        
        // just for convenience
        customView = view as! СontactsView
        
        // since our view is created through storyboards, we have to configure it here
        // it may be configured within the view's constructors otherwise
        customView.configureSubviews()
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

