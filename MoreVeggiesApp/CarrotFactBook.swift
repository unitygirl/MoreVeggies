//
//  CarrotFactBook.swift
//  MoreVeggiesApp
//
//  Created by LaCharite, Noelle on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import Foundation
struct CarrotFactBook {
    let factsArray = [
        "Carrot Fact 1",
        "Carrot Fact 2",
        "Carrot Fact 3",
        "Carrot Fact 4",
        "Carrot Fact 5",
        "Carrot Fact 6",
        "Carrot Fact 7",
        "Carrot Fact 8",
        "Carrot Fact 9",
        "Carrot Fact 10"
    ]
    
    func randomFact() -> String {
        var unsignedArrayCount = UInt32(factsArray.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        return factsArray[randomNumber]
        
}
}