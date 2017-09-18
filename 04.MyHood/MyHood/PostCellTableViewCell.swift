//
//  PostCellTableViewCell.swift
//  MyHood
//
//  Created by Kenneth Kang on 18/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = 15
    }
    
    func configureCell(_ post: Post) {
        titleLabel.text = post.title
        descLabel.text = post.descText
    }


}
