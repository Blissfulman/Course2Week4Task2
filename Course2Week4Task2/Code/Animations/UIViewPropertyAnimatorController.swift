//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

var animator: UIViewPropertyAnimator!

class UIViewPropertyAnimatorController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            let timingParameters = UISpringTimingParameters(mass: 2.0, stiffness: 30.0, damping: 7.0, initialVelocity: .zero)
            animator = UIViewPropertyAnimator(duration: 1.0, timingParameters: timingParameters)
            animator.addAnimations {
                self.animationView.center.x += 300.0
                // Если указать точно ".pi", то вращение происходит против часовой стрелки
                self.animationView.transform = CGAffineTransform(rotationAngle: 3.14159265)
                self.animationView.transform = self.animationView.transform.scaledBy(x: 1.5, y: 1.5)
            }
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: view).x / view.bounds.size.width
        case .ended:
            guard let xPosition = self.animationView.layer.presentation()?.position.x else {
                fatalError("Не удалось получить позицию вью")
            }
            animator.isReversed = xPosition > self.view.center.x ? false : true
            animator.startAnimation()
        default:
            ()
        }
    }
}
