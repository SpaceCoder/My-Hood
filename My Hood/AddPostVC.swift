//
//  AddPostVC.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //Properties
    var ImagePicker: UIImagePickerController!
    
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
        
        ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
    }

    
    @IBAction func CancelBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func AddPicBtn(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(ImagePicker, animated: true, completion: nil)
    }

    @IBAction func AddPostBtn(sender: AnyObject) {
        if let image = EnterImage.image, let title = EnterTitle.text, let descrip = EnterDescription.text {
            
            let path = DataService.instance.SaveImageAndCreatePath(image)
            
            let NewPost = Post(title: title, description: descrip, image: path)
            DataService.instance.AddPost(NewPost)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        ImagePicker.dismissViewControllerAnimated(true, completion: nil)
        EnterImage.image = image
    }
    
}
