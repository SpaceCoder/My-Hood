//
//  Post.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/18/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import Foundation
import UIKit

class Post: NSObject, NSCoding {
    private var _Title: String!
    private var _Description:String!
    private var _PostImage: String!
    
    var Title: String {
        return _Title
    }
    
    var Description: String {
        return _Description
    }
    
    var PostImage: String {
        return _PostImage
    }
    
    init(title: String, description: String, image: String) {
        _Title = title
        _Description = description
        _PostImage = image
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._Title = aDecoder.decodeObjectForKey("Title") as? String
        self._Description = aDecoder.decodeObjectForKey("Description") as? String
        self._PostImage = aDecoder.decodeObjectForKey("PostImage") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_Title, forKey: "Title")
        aCoder.encodeObject(_Description, forKey: "Description")
        aCoder.encodeObject(_PostImage, forKey: "PostImage")
    }
}