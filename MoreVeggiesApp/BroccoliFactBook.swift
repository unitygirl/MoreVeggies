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
        "Broccoli is very high in Vitamin C, making 1 cup of chopped broccoli the Vitamin C equivalent of an orange.",
        "Broccoli is high in fiber. Not only in soluble fiber but insoluble as well.",
        "Broccoli contains the flavonoid kaempferol. Kaempferol is an anti-inflammatory, helps fight against cancer and heart disease.",
        "Broccoli is one of the very low calorie vegetables; provides just 34 calories per 100 g.",
        "It contains very good amounts of an anti-oxidant vitamin, vitamin-A, essential for healthy eye-sight.",
        "With an origin in Italy, broccoli was once known as Italian asparagus.",
        "The word Broccoli comes from the Italian word ‘brocco’ meaning arm or branch. ",
        "Broccoli promotes healthy bones.",
        "Broccoli boosts your immune system.",
        "Broccoli helps you feel full soyou don't overeat."
    ]
    
    func randomFact() -> String {
        var unsignedArrayCount = UInt32(factsArray.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        return factsArray[randomNumber]
        
    }
}
