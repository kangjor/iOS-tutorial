//
//  Post.swift
//  MyHood
//
//  Created by Kenneth Kang on 18/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    // fileprivate is one of the new in Swift 3, and accessible to all entities in that source file
    fileprivate var _imagePath: String!
    fileprivate var _title: String!
    fileprivate var _descText: String!
    
    var imagePath: String {
        return _imagePath
    }
    var title: String {
        return _title
    }
    var descText: String {
        return _descText
    }
    
    init(imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._title = title
        self._descText = description
    }
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._title, forKey: "title")
        aCoder.encode(self._descText, forKey: "description")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._title = aDecoder.decodeObject(forKey: "title") as? String
        self._descText = aDecoder.decodeObject(forKey: "description") as? String
    }
    
    
}
