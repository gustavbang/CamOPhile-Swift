//
//  ViewController2.swift
//  CamOPhile
//
//  Created by admin on 12/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//
import UIKit
import FirebaseStorage
import FirebaseDatabase

class ViewController2: UIViewController {

    @IBOutlet weak var downloadBtn: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //alt hernede er storage
    var storage: StorageReference {
        return Storage.storage().reference().child("images")
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onDownloadPressed(_ sender: Any) {
        
        var downloadTask: AnyObject!
        
        /*for download in downloads {
            downloadTask = download.getData(maxSize: 1024*1024*6) { (data, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    self.imageView.image = image
                }
                print(error ?? "NO ERROR")
            }
        }*/
        downloadTask.resume()

    }

    
    
    func setCornerRadius() {
        imageView.layer.cornerRadius = 15
        downloadBtn.layer.cornerRadius = 15
    }

}
