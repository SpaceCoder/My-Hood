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
        let PostData = NSKeyedArchiver.archivedDataWithRootObject(_PostArray)
        NSUserDefaults.standardUserDefaults().setObject(PostData, forKey: POSTDATA)
        NSUserDefaults.standardUserDefaults().synchronize()
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
    
    func SaveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgName = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = DocumentsPathForFileName(imgName)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgName
    }
    
    func ImageForPath(path: String) -> UIImage? {
        let FullPath = DocumentsPathForFileName(path)
        let image = UIImage(named: FullPath)
        return image
    }
    
    func DocumentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }    

}
