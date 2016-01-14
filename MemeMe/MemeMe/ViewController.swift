//
//  ViewController.swift
//  MemeMe
//
//  Created by Rachel Guo on 1/13/16.
//  Copyright © 2016 esri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePickerView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func pickAnImage(sender: AnyObject) {
        print("pickAnImage")
        let pickerController = UIImagePickerController()
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    
    }
   
    

}

