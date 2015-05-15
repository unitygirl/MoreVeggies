//
//  FactBook.swift
//  MoreVeggiesApp
//
//  Created by LaCharite, Noelle on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import Foundation

struct BroccoliFactBook {
    let factsArray = [
        "Broccoli Fact 1",
        "Broccoli Fact 2",
        "Broccoli Fact 3",
        "Broccoli Fact 4",
        "Broccoli Fact 5",
        "Broccoli Fact 6",
        "Broccoli Fact 7",
        "Broccoli Fact 8",
        "Broccoli Fact 9",
        "Broccoli Fact 10"
    ]
    
    func randomFact() -> String {
        var unsignedArrayCount = UInt32(factsArray.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        return factsArray[randomNumber]
        
    }
}
