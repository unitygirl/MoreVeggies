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
    
    func loadData(){
        
        // Use optional binding to confirm the managedObjectContext
        if let moc = self.managedObjectContext {
            
            // Create some dummy data to work with
            var items = [
                ("Broccoli is very high in Vitamin C, making 1 cup of chopped broccoli the Vitamin C equivalent of an orange."),
                ("Broccoli is high in fiber. Not only in soluble fiber but insoluble as well."),
                ("Broccoli contains the flavonoid kaempferol. Kaempferol is an anti-inflammatory, helps fight against cancer and heart disease."),
                ("Broccoli is one of the very low calorie vegetables; provides just 34 calories per 100 g."),
                ("It contains very good amounts of an anti-oxidant vitamin, vitamin-A, essential for healthy eye-sight."),
                ("With an origin in Italy, broccoli was once known as Italian asparagus."),
                ("The word Broccoli comes from the Italian word ‘brocco’ meaning arm or branch. "),
                ("Broccoli promotes healthy bones."),
                ("Broccoli boosts your immune system."),
                ("Broccoli helps you feel full so you don't overeat.")
                
            ]
            
            // Loop through, creating items
            for (itemText) in items {
                // Create an individual item
                SecondViewController.createInManagedObjectContext(moc, text: itemText)
            }
            
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        println("video controller loaded")
        
        //embed video and play
        intializeVideoPlayer()
        loadData()
        
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

            //print(randomNumber)
            
            //Set the on screen text
            factStringText.text = fetchResults[randomNumber].factText
            //factStringText.text = "Broccoli is a health snack!"
            
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

