//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
            let dx = self.view.frame.width - self.animationView.frame.width
            self.animationView.frame = self.animationView.frame.offsetBy(dx: dx, dy: 0)
            self.animationView.transform = self.animationView.transform.rotated(by: .pi)
        })
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.view.transform = self.view.transform.rotated(by: .pi)
            self.flipButton.transform = self.flipButton.transform.rotated(by: .pi)
        })
    }
}
