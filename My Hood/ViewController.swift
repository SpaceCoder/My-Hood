//
//  ViewController.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Outlets
    @IBOutlet weak var PostTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PostTable.delegate = self
        PostTable.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "PostLoaded:", name: "PostLoaded", object: nil)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            let post = DataService.instance.PostArray[indexPath.row]
            cell.ConfigureCell(post)
            return cell
        } else {
            let cell = PostCell()
            return cell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.PostArray.count
    }

    @IBAction func AddPostBtn(sender: AnyObject) {
        performSegueWithIdentifier("GoToAddPost", sender: nil)
    }
    
    func PostLoaded(notif: AnyObject) {
        PostTable.reloadData()
    }
}

