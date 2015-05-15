//
//  FirstViewController.swift
//  MoreVeggiesApp
//
//  Created by LaCharite, Noelle on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func veggieFactButton(sender: AnyObject) {
        showFunFact()
    }
    @IBOutlet weak var veggieFactButton: UIButton!
    @IBOutlet weak var veggieFactLabel: UILabel!
    
    let factBook = BroccoliFactBook()
    let colorWheel = ColorWheel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        veggieFactLabel.text = factBook.randomFact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showFunFact() {
        var randomColor = colorWheel.randomColor()
        view.backgroundColor = randomColor
       veggieFactButton.tintColor = randomColor
        veggieFactLabel.text = factBook.randomFact()
    }

}

