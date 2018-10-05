//
//  ImageUploadManager.swift
//  CamOPhile
//
//  Created by admin on 05/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//

import UIKit
import FirebaseStorage

struct Constants{
    
    struct car {
        static let imagesFolder: String = "carImages"
    }
}

class ImageUploadManager: NSObject {
    func uploadImage(_ image: UIImage, completionBlock: (_ url:String?, _ errorMessage: String?) -> Void) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let imageName = "\(Date().timeIntervalSince1970).jpg"
        let imagesReference = storageReference.child(Constants.car.imagesFolder).child(imageName)
        
        if let imageData = UIImageJPEGRepresentation() {
            
            
        }
    }
}
