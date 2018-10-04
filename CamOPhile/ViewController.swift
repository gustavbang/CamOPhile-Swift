//
//  ViewController.swift
//  CamOPhile
//
//  Created by admin on 04/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var takePic: UIButton!
    @IBOutlet weak var pickFromAlbum: UIButton!
    
    
    override func viewDidLoad() {
        takePic.layer.cornerRadius = 10
        pickFromAlbum.layer.cornerRadius = 10
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

