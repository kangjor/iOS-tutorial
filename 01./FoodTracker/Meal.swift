//
//  Meal.swift
//  FoodTracker
//
//  Created by Kenneth Kang on 13/09/2017.
//  Copyright © 2017 Under Corp. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
//        if name.isEmpty || rating < 0 {
//            return nil
//        }
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating < 6) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    
}
