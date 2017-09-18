//
//  DataService.swift
//  MyHood
//
//  Created by Kenneth Kang on 18/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    // MARK: Properties
    static let instance = DataService()
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    // MARK: Functions
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postsData, forKey: "posts")
        // saving data
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: "posts") as? Data {
            // loading data
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        
        // sends a signal out that posts have been loaded and it could be listened from controllers
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) {
        
    }
    
    func imageForPath(path: String) {
        
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
}
