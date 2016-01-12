//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rachel Guo on 1/11/16.
//  Copyright © 2016 esri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recordingLabel.hidden = true;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopRecording(sender: UIButton) {
        
        recordingLabel.hidden = true;
        
    }
    @IBAction func recordAudio(sender: UIButton) {
        
        recordingLabel.hidden = false;
        //TODO: Record voice
        
    }

}

