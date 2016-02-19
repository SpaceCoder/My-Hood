//
//  AddPostVC.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    //Outlets
    @IBOutlet weak var EnterImage: UIImageView!
    @IBOutlet weak var AddPicBtn: UIButton!
    @IBOutlet weak var EnterTitle: UITextField!
    @IBOutlet weak var EnterDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnterImage.layer.cornerRadius = EnterImage.frame.width/2
        EnterImage.clipsToBounds = true
        AddPicBtn.layer.cornerRadius = AddPicBtn.frame.width/2
        AddPicBtn.clipsToBounds = true
    }

    
    @IBAction func CancelBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func AddPicBtn(sender: AnyObject) {
        
    }

    @IBAction func AddPostBtn(sender: AnyObject) {
        
    }
    
}
