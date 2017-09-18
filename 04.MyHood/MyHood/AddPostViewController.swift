//
//  AddPostViewController.swift
//  MyHood
//
//  Created by Kenneth Kang on 18/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImg.layer.cornerRadius = 120
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
    }
    
    // MARK: Actions
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
        // validation
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
            let post = Post(imagePath: "", title: title, description: desc)
            
            DataService.instance.addPost(post: post)
            // close view and go to the previous
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        // show image picker
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // when image selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = selectedImage
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
