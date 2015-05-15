//
//  SecondViewController.swift
//  MoreVeggiesApp
//
//  Created by LaCharite, Noelle on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
 
    
    @IBOutlet weak var funFactLabel: UILabel!
    
    @IBOutlet weak var funFactButton: UIButton!
    let factBook = CarrotFactBook()
    let colorWheel = ColorWheel()
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, text: String) -> BrocolliFacts {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("BrocolliFacts", inManagedObjectContext: moc) as! BrocolliFacts
        newItem.factText = text
        
        return newItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("BrocolliFacts", inManagedObjectContext: self.managedObjectContext!) as! BrocolliFacts
        
        newItem.factText = "Fact about Broccoli #1"
        
        // Use optional binding to confirm the managedObjectContext
        if let moc = self.managedObjectContext {

        // Create some dummy data to work with
        var items = [
            ("Fact #1"),
            ("Fact #2"),
        ]
        
        // Loop through, creating items
        for (itemText) in items {
            // Create an individual item
            SecondViewController.createInManagedObjectContext(moc, text: itemText)
        }

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showFunFact() {
        var randomColor = colorWheel.randomColor()
        view.backgroundColor = randomColor
        funFactButton.tintColor = randomColor
        funFactLabel.text = factBook.randomFact()
    }

}

