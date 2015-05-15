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
            ("Broccoli helps you feel full soyou don't overeat.")

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

