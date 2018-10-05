//
//  ViewController.swift
//  CamOPhile
//
//  Created by admin on 04/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var takePic: UIButton!
    @IBOutlet weak var pickFromAlbum: UIButton!
    
    //tekstfelt 1
    @IBOutlet weak var uploadImage: UIImageView!
    //tekstfelt 2
    @IBOutlet weak var downloadImage: UIImageView!
    
    //filnavn til billede som skal uploades
    let filename = "earth.jpg"
    
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
        uploadImage.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    //alt hernede er storage
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    @IBAction func onUploadPressed(_ sender: Any) {
        guard let image = uploadImage.image else {
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return
        }
        
        let uploadImageRef = imageReference.child("hej")
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        
        uploadTask.resume()
    }
    @IBAction func onDownloadPressed(_ sender: Any) {
    }
}

