//
//  View.swift
//  KazanMeetupTestExample
//
//  Created by Bulat Khabirov on 11.03.17.
//  Copyright © 2017 UveeStudio. All rights reserved.
//

import UIKit

class View: UIView {
    @IBOutlet var contactsTableView: UITableView!
    @IBOutlet var contactsCountLabel: UILabel!
    
    var contacts = [ViewConfig]()
    
    // MARK: - .XIB helpers
    private var view: UIView!
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view
        addSubview(view)
    }
    
    func configure(data: [ViewConfig]) {
        self.contacts = data
        self.contactsCountLabel.text = "\(contacts.count) контактов"
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "View", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func configureSubviews() {
        contactsTableView.rowHeight = UITableViewAutomaticDimension
        contactsTableView.estimatedRowHeight = 50
        contactsTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        configureSubviews()
    }
}
