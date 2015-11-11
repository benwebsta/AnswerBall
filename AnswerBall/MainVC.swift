//
//  MainVC.swift
//  AnswerBall
//
//  Created by Ben Webster on 11/10/15.
//  Copyright © 2015 Ben Webster. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    var answers = [
        "Suck My Dick, OR COCK!",
        "Fuck you kid, youre a dick!",
        "BOB SAGGIT!",
        "FUCK SALT",
        "DAMNIT these fish stick are as hard as tits!",
        "BITCH, i love you!",
        "SHIT.... SHIT........ SHIIIIIIT!",
        "ID KILL MYSELF TOO IF MY LAST NAME WAS COOOOOMBS",
        "PISSING OUT THE WINDOW, AND SHITTING OUT THE WINDOW ARE TWO DIFFERENT THINGS!!",
        "SUCK MY DICK",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = "Rudy is a pussy"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getAnswerTapped(sender: AnyObject) {
        
        //get a random number from the array count
        let random = Int(arc4random_uniform(UInt32(answers.count)))
        
        //display the answer
        label.text = answers[random]
        
        //play the sound
 
        do {
            try playSound("BallSound", fileExtension: "wav")
        } catch {
            return
        }
        
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
            getAnswerTapped(self)
    }
    
    
    
        func playSound(fileName: String, fileExtension: String) throws {
            super.viewDidLoad()
            
            let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            
            dispatch_async(dispatchQueue, { let mainBundle = NSBundle.mainBundle()
                
                let filePath = mainBundle.pathForResource("\(fileName)", ofType:"\(fileExtension)")
                
                if let path = filePath{
                    let fileData = NSData(contentsOfFile: path)
                    
                    do {
                        /* Start the audio player */
                        self.audioPlayer = try AVAudioPlayer(data: fileData!)
                        
                        guard let player : AVAudioPlayer? = self.audioPlayer else {
                            return
                        }
                        
                        /* Set the delegate and start playing */
                        player!.delegate = self
                        if player!.prepareToPlay() && player!.play() {
                            /* Successfully started playing */
                        } else {
                            /* Failed to play */
                        }
                        
                    } catch {
                        //self.audioPlayer = nil
                        return
                    }
                    
                }
                
            })
            
        }

        
    }

    
    
    
    
    

