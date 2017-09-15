//
//  ViewController.swift
//  Hellooo World
//
//  Created by Kenneth Kang on 15/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var images = [UIImageView]()
    var contentWidth: CGFloat = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0...2 {
            // images loading
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            // present images
            var newX: CGFloat = 0
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
//            contentWidth += newX
            contentWidth = view.frame.size.width * CGFloat(x+1)
            print(contentWidth)
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
            
            scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        }
    }


}

