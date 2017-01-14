//
//  ViewController.swift
//  BirdFlyInJung
//
//  Created by Nguyen Van Tuan on 1/12/17.
//  Copyright © 2017 MyProjects. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayler = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpDown()
        playSound()
    }
    
    func drawJungle() {
        let jungle = UIImageView(image: UIImage(named: "jungle.jpg"))
        jungle.frame = self.view.bounds
        jungle.contentMode = .ScaleAspectFill
        self
        .view.addSubview(jungle)
    }
    
    func addBird() {
        bird = UIImageView(frame: CGRectMake(0, 0, 110, 60))
        bird.animationImages = [UIImage(named: "bird0.png")!, UIImage(named: "bird1.png")!, UIImage(named: "bird2.png")!, UIImage(named: "bird3.png")!, UIImage(named: "bird4.png")!, UIImage(named: "bird5.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    func flyUpDown() {
        UIView.animateWithDuration(4, animations: {
            self.bird.center = CGPointMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50)
        
            }) { (finished) in
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
                
                UIView.animateWithDuration(4, animations: {
                    self.bird.center = CGPointMake(50, self.view.bounds.size.height - 50)
                    }) { (finished) in
                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(-45))
                        
                        UIView.animateWithDuration(4, animations: {
                            self.bird.center = CGPointMake(self.view.bounds.size.width - 50, 50)
                            }) { (finished) in
                                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(45))
                                
                                UIView.animateWithDuration(4, animations: {
                                    self.bird.center = CGPointMake(50, 50)
                                    }) { (finished) in
                                    self.bird.transform = CGAffineTransformIdentity
                                        
                                        self.flyUpDown()
                                }
                        }
                }
        }
    }
    
    func playSound() {
        let filePath = NSBundle.mainBundle().pathForResource("mp3", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audioPlayler = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayler.prepareToPlay()
        audioPlayler.play()
        //audioPlayler.stop()
    }

}

