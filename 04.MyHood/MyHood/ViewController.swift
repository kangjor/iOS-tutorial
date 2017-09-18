//
//  ViewController.swift
//  MyHood
//
//  Created by Kenneth Kang on 18/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // add listener for event
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
        
        // Prepare sample data
//        let post = Post(imagePath: "", title: "Post 1", description: "Post 1 description")
//        let post2 = Post(imagePath: "", title: "Post 2", description: "Post 2 description")
//        let post3 = Post(imagePath: "", title: "Post 3", description: "Post 3 description")
//        
//        posts.append(post)
//        posts.append(post2)
//        posts.append(post3)
//        
//        tableView.reloadData()
        
    }

    // required methods for protocols (UITableViewDelegate, UITableViewDataSource)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let post = posts[indexPath.row]
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCellTableViewCell {
            cell.configureCell(post)
            return cell
        }
        return PostCellTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }

    


}

