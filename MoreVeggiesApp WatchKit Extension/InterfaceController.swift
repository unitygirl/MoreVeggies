//
//  InterfaceController.swift
//  MoreVeggiesApp WatchKit Extension
//
//  Created by LaCharite, Noelle on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import WatchKit
import UIKit
import Foundation
import CoreData


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var vegLabel: WKInterfaceLabel!
   
    @IBOutlet weak var labelText: WKInterfaceLabel!
    
    @IBAction func moreFactsPressed() {
        labelText.setText("Green looks good on you!")
    }
    
    @IBAction func moreVeggiesPressed() {
        vegLabel.setText("Carrots")
        labelText.setText("Good for your eyes O_O")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "BrocolliFacts")
        
        
            
            //Set the on screen text
            //factText. = "Some fact here"
            
        
        // Configure interface objects here.
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
