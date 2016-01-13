//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rachel Guo on 1/11/16.
//  Copyright © 2016 esri. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
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
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    @IBAction func recordAudio(sender: UIButton) {
        
        recordingLabel.hidden = false;
        stopButton.hidden = false;
        recordButton.enabled = false;
        //TODO: Record voice
        print("Recording");
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        // Modify the line that sets the name of the recording
        let recordingName = "my_audio.wav"
        
        // The remaining code is the same
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self;
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "stopRecording"){
        
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
        
            let data = sender as! RecordedAudio
            
            playSoundsVC.receivedAudio = data;
        }
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if(flag){
        //TODO: save the file
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        //TODO: move to the next scene to perform segue
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else {
        print("error: Record failed.")
        }
    }

}

