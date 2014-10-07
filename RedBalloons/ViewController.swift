//
//  ViewController.swift
//  RedBalloons
//
//  Created by Dennis Ginley on 10/6/14.
//  Copyright (c) 2014 Dennis Ginley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var balloonLabel: UILabel!
    
    let numberOfBalloons = 99
    
    let numberOfBalloonImages = 4
    
    let balloonNames = ["RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg",]

    var balloonArray = [Balloon]()
    
    var oldBalloonName = ""
    
    var index = 0
    
    
    
    @IBAction func toolbarButtonPressed(sender: UIBarButtonItem)
    {
        var isBalloonNameTheSame = true
        while isBalloonNameTheSame
        {
            index = Int(arc4random_uniform(UInt32(numberOfBalloons)))
            println("balloonName = \(balloonArray[index].balloonImage)")
            println("oldballoonName = \(oldBalloonName)")
            if balloonArray[index].balloonImage != oldBalloonName
            {
                isBalloonNameTheSame = false
            }
        }
        oldBalloonName = balloonArray[index].balloonImage
        imageView.image = UIImage(named: balloonArray[index].balloonImage)
        balloonLabel.text = "\(balloonArray[index].balloonNumber)"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "BerlinTVTower.jpg")
        
        

        
        // Generate 99 Balloons
        for var i = 0; i < numberOfBalloons; i++
        {
            // Generate a random index for the balloon image
            var j = Int(arc4random_uniform(UInt32(numberOfBalloonImages)))
            var nextBalloon = Balloon()
            nextBalloon.balloonNumber = i
            nextBalloon.balloonImage = balloonNames[j]
            balloonArray.append(nextBalloon)
            
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

