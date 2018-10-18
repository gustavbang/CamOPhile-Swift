//
//  StartScreenController.swift
//  CamOPhile
//
//  Created by admin on 15/10/2018.
//  Copyright © 2018 Gustav Bang. All rights reserved.
//

import UIKit

class StartScreenController: UIViewController {

    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var downloadBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func setCornerRadius() {
        uploadBtn.layer.cornerRadius = 15
        downloadBtn.layer.cornerRadius = 15
        
    }
}
