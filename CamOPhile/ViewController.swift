//
//  ViewController.swift
//  CamOPhile
//
//  Created by admin on 04/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref: DatabaseReference!

    @IBOutlet weak var pickFromAlbum: UIButton!
    @IBOutlet weak var uploadImage: UIImageView!
    
    @IBOutlet weak var uploadBtn: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        setCornerRadius()
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
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
    
  
    
    @IBAction func onUploadPressed(_ sender: Any) {
        guard let image = uploadImage.image else {
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return
        }
        
        
        //unique id
        let imageName = NSUUID.init()
        
        let storageRef = Storage.storage().reference().child("\(imageName)")

        //til at få metadata
        let meta = StorageMetadata()
        meta.contentType = "image/png"
        
        //laver en task
        let uploadTask = storageRef.putData(imageData, metadata: meta) { (metadata, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            
            metadata?.storageReference?.downloadURL(completion: { (url, error) in
                if (error == nil) {
                    if let downloadUrl = url {
                        // Make you download string
                        let imageUrl = downloadUrl.absoluteString
                        
                        let values = ["profileImageUrl" : imageUrl]

                        self.registerUserIntoDatabase(values: values)

                    }
                } else {
                    print("fail")
                    // Do something if error
                }
            })

            
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        
        uploadTask.resume()
        
    }
    
    
    private func registerUserIntoDatabase(values : [String: String]) {
        let ref = Database.database().reference()
        let usersReference = ref.child("image")
        usersReference.updateChildValues(values, withCompletionBlock: {
            (err, ref) in
            
            if err != nil {
                print(err)
                return
            }
            self.dismiss(animated: true, completion: nil)
        })
    }
   
    
    func setCornerRadius() {
        pickFromAlbum.layer.cornerRadius = 15
        uploadImage.layer.cornerRadius = 15
        uploadBtn.layer.cornerRadius = 15
        
    }
    
    
    
}

