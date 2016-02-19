//
//  Post.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import Foundation
import UIKit

class Post {
    private var _Title: String
    private var _Description:String
    private var _PostImage: UIImage
    
    init(title: String, description: String, image: UIImage) {
        _Title = title
        _Description = description
        _PostImage = image
    }
}