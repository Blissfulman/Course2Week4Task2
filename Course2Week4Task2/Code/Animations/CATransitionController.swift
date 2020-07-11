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

        let moveInAnimation = CATransition()
        moveInAnimation.delegate = self
        self.textLabel.text = "Sliding!"
        self.textLabel.textColor = .green
        moveInAnimation.duration = 1.0
        moveInAnimation.type = CATransitionType.moveIn
        moveInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.textLabel.layer.add(moveInAnimation, forKey: "moveIn")
    }
    
    private func fadeAnimation() {
        let fadeAnimation = CATransition()
        textLabel.text = "Initial text"
        textLabel.textColor = .orange
        fadeAnimation.duration = 1.0
        fadeAnimation.type = CATransitionType.fade
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.textLabel.layer.add(fadeAnimation, forKey: "fade")
    }
}

extension CATransitionController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        fadeAnimation()
    }
}
