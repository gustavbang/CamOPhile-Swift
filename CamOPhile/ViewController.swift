//
//  ViewController.swift
//  CamOPhile
//
//  Created by admin on 04/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var takePic: UIButton!
    @IBOutlet weak var pickFromAlbum: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        takePic.layer.cornerRadius = 10
        pickFromAlbum.layer.cornerRadius = 10
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func takeAPicture(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickFromAlbum(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Returned from imagepicking")
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        imageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

