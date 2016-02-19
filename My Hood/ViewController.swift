//
//  ViewController.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Properties
    var PostArray = [Post]()
    
    //Outlets
    @IBOutlet weak var PostTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PostTable.delegate = self
        PostTable.dataSource = self
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostArray.count
    }

}

