//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    
    var animationViewOrigin: CGPoint!
    var dynamicAnimator: UIDynamicAnimator!
    
    // Рассчёт расстояния между центрами связываемых фигур
    lazy var length = sqrt(pow((animationView.center.x - anchorView.center.x), 2) + pow((animationView.center.y - anchorView.center.y), 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationViewOrigin = animationView.frame.origin
        performUIKitDynamicsAnimation()
    }
    
    @IBAction func panAnchorView(_ sender: UIPanGestureRecognizer) {
        let animationView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            animationView.center = CGPoint(x: animationView.center.x + translation.x, y: animationView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            performUIKitDynamicsAnimation()
        case .ended:
            performUIKitDynamicsAnimation()
        default:
            ()
        }
    }

    private func performUIKitDynamicsAnimation() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        let attachment = UIAttachmentBehavior(item: animationView, attachedToAnchor: anchorView.center)
        attachment.length = length
        let gravity = UIGravityBehavior(items: [animationView])
        /// **КОММЕНТАРИЙ**
        /// можно поиграть с значениями угла и магнитуды колебаний
        gravity.setAngle(1.2, magnitude: 0.5)
        let itemBehaviour = UIDynamicItemBehavior(items: [animationView])
        itemBehaviour.elasticity = 0.8
        /// добавил ограничение колебаний, чтобы большой квадрат за bounds не улетал 
        let collision = UICollisionBehavior(items: [animationView])
        collision.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(attachment)
        dynamicAnimator.addBehavior(gravity)
        dynamicAnimator.addBehavior(collision)
    }
}
