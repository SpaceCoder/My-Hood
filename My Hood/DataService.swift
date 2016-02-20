//
//  DataService.swift
//  My Hood
//
//  Created by Anjam Nabil Islam on 2/20/16.
//  Copyright © 2016 Anjam. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    private var _PostArray = [Post]()
    
    var PostArray: [Post] {
        return _PostArray
    }
    
    let POSTDATA: String = "PostData"
    
    func SavePostArray() {
        let PostData = NSKeyedArchiver.archivedDataWithRootObject(POSTDATA)
        NSUserDefaults.standardUserDefaults().setObject(PostData, forKey: POSTDATA)
    }
    
    func LoadPostArray() {
        if let PostData = NSUserDefaults.standardUserDefaults().objectForKey(POSTDATA) as? NSData {
            if let TempPostArray = NSKeyedUnarchiver.unarchiveObjectWithData(PostData) as? [Post] {
                _PostArray = TempPostArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "PostLoaded", object: nil))
    }
    
    func AddPost(post: Post) {
        _PostArray.append(post)
        SavePostArray()
        LoadPostArray()
    }
}
