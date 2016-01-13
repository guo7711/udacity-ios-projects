//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rachel Guo on 1/12/16.
//  Copyright © 2016 esri. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!

    @IBAction func snailButtonClicked(sender: UIButton) {
        
        audioPlayer.stop()
        audioPlayer.rate = 0.5;
        audioPlayer.play()
    }
    
    @IBAction func stopButtonClicked(sender: UIButton) {
        
        audioPlayer.stop()
    }
    
    @IBAction func rabbitButtonClicked(sender: UIButton) {
        
        audioPlayer.stop()
        audioPlayer.rate = 2;
        audioPlayer.play()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            
            let audioURL = NSURL.init(fileURLWithPath: filePath)
            
            audioPlayer = try! AVAudioPlayer(contentsOfURL: audioURL)
            audioPlayer.enableRate = true
        }
        else {
            print("error: filepath is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
