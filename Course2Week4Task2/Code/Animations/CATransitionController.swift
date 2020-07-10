//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        
        let startText = textLabel.text
        let startTextColor = textLabel.textColor
        
//        let movS = {
            let moveInAnimation = CATransition()
            self.textLabel.text = "Sliding!"
            self.textLabel.textColor = .green
            moveInAnimation.duration = 1.0
//            moveInAnimation.startProgress = 0
//            moveInAnimation.endProgress = 1.0
            moveInAnimation.type = CATransitionType.moveIn
            moveInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            self.textLabel.layer.add(moveInAnimation, forKey: "moveIn")
//        }
        
//        let movF = {
            let fadeAnimation = CATransition()
            self.textLabel.text = startText
            self.textLabel.textColor = startTextColor
//            fadeAnimation.startProgress = 1.0
//            fadeAnimation.endProgress = 2.0
            fadeAnimation.duration = 1.0
            fadeAnimation.beginTime = 2
//            fadeAnimation.autoreverses = true
            fadeAnimation.type = CATransitionType.fade
            fadeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            self.textLabel.layer.add(fadeAnimation, forKey: "fade")
//        }
        
        let animations = [fadeAnimation]//, fadeAnimation]
        
        let group = CAAnimationGroup()
        group.animations = animations
        group.beginTime = 2
        textLabel.layer.add(group, forKey: nil)
        
//        movS()
//        movF()
        
//        UIView.animate(withDuration: 2, animations: movS, completion: {
//            (value: Bool) in
//            UIView.animate(withDuration: 3, delay: 2, animations: movF)
//        })
    }
}
