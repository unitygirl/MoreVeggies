//
//  FirstViewController.swift
//  MoreVeggiesApp
//
//  Created by LaCharite, Noelle on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreData

class FirstViewController: UIViewController {

    @IBOutlet weak var factStringText: UILabel!
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
 
    
    var moviePlayer:MPMoviePlayerController!
    let baseURL = NSURL(string: "https://s3-us-west-2.amazonaws.com/goonberries/moreveggiesplz/")
    var videoFile = "Broccoli_Final.mp4"

    //helper function for creating embedding a video file
    func intializeVideoPlayer() {
        
        //Construct URL based on arguments
        var absURL = NSURL(string: videoFile, relativeToURL: baseURL)
        
        //Build screen size
        var screenRect = UIScreen.mainScreen().bounds
        var videoWidth  : Double = Double(screenRect.size.width)
        var videoHeight : Double = round(videoWidth*0.5625)
        var videoTopPadding = 100.0
        
        
        //Create Media player with remote file
        moviePlayer = MPMoviePlayerController(contentURL: absURL)
        moviePlayer.view.frame = CGRect(x: 0.0, y: videoTopPadding, width: videoWidth, height: videoHeight)
        
        self.view.addSubview(moviePlayer.view)
        
        //Start playing video and hide screen controls
        moviePlayer.fullscreen = true
        moviePlayer.controlStyle = MPMovieControlStyle.None
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("video controller loaded")
        
        //embed video and play
        intializeVideoPlayer()
        
    }
    
    //Helper Function for changing fact text on screen
    func setFactText() {
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "BrocolliFacts")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [BrocolliFacts] {
            
            var unsignedArrayCount = UInt32(fetchResults.count)
            var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            var randomNumber = Int(unsignedRandomNumber)

            
            //Set the on screen text
            //factStringText.text = fetchResults[randomNumber].factText
            factStringText.text = "Brocolli is a health snack!"
            
        }

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
            setFactText()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

