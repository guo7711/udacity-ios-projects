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
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        recordingLabel.hidden = true;
        stopButton.hidden = true;
        recordButton.enabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopRecording(sender: UIButton) {
        
        recordingLabel.hidden = true;
        recordButton.enabled = true;
        
    }
    @IBAction func recordAudio(sender: UIButton) {
        
        recordingLabel.hidden = false;
        stopButton.hidden = false;
        recordButton.enabled = false;
        //TODO: Record voice
        print("Recording");
    }

}

