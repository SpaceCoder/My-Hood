//
//  PostCell.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var PostTitle: UILabel!
    @IBOutlet weak var PostDescription: UILabel!
    @IBOutlet weak var PostImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PostImage.layer.cornerRadius = PostImage.frame.width/2
        PostImage.clipsToBounds = true
    }
    
    func ConfigureCell (post: Post){
        PostTitle.text = post.Title
        PostDescription.text = post.Description
        PostImage.image = DataService.instance.ImageForPath(post.PostImage)
    }

}
