//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orangeViewGR = UITapGestureRecognizer(target: self, action: #selector(tapOrangeView(recognizer:)))
        orangeView.addGestureRecognizer(orangeViewGR)
        
        let cyanViewGR = UITapGestureRecognizer(target: self, action: #selector(tapCyanView(recognizer:)))
        cyanView.addGestureRecognizer(cyanViewGR)
        
        let blueViewGR = UITapGestureRecognizer(target: self, action: #selector(tapBlueView(recognizer:)))
        blueView.addGestureRecognizer(blueViewGR)
        
        let greenViewGR = UITapGestureRecognizer(target: self, action: #selector(tapGreenView(recognizer:)))
        greenView.addGestureRecognizer(greenViewGR)
    }
    
    @objc
    private func tapOrangeView(recognizer: UITapGestureRecognizer) {
        let endValue = orangeView.frame.width / 2
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        animation.duration = 1.0
        animation.fromValue = 0
        animation.toValue = endValue
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        orangeView.layer.add(animation, forKey: "rounding")
        orangeView.layer.cornerRadius = endValue
    }
    
    @objc
    private func tapCyanView(recognizer: UITapGestureRecognizer) {
        let endValue: Float = 0.0
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.duration = 1.0
        animation.fromValue = 1
        animation.toValue = endValue
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        cyanView.layer.add(animation, forKey: "dissapearing")
        cyanView.layer.opacity = endValue
    }
    
    @objc
    private func tapBlueView(recognizer: UITapGestureRecognizer) {
        // Вычисление координаты x на основе половины диагонали фигуры
        let xCenter = view.frame.width - sqrt(pow(blueView.frame.width, 2) + pow(blueView.frame.height, 2)) / 2
        
        // Анимация движения
        let endPosition = CGPoint(x: xCenter, y: blueView.center.y)
        let moveAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        moveAnimation.fromValue = blueView.center
        moveAnimation.toValue = endPosition
        
        // Анимация вращения
        let endAngle: CGFloat = 7 * .pi / 4
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = endAngle

        // Группировка анимаций
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [moveAnimation, rotationAnimation]
        groupAnimation.duration = 2.0
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        blueView.layer.add(groupAnimation, forKey: "groupAnimation")
        blueView.layer.position = endPosition
        blueView.transform = CGAffineTransform(rotationAngle: endAngle)
    }
    
    @objc
    private func tapGreenView(recognizer: UITapGestureRecognizer) {
        // Анимация цвета
        let firstColor = UIColor.green.cgColor
        let secondColor = UIColor.magenta.cgColor
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        colorAnimation.fromValue = firstColor
        colorAnimation.toValue = secondColor
        colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)

        // Анимация движения
        let firstPosition = greenView.center
        let secondPosition = view.center
        let moveAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        moveAnimation.fromValue = firstPosition
        moveAnimation.toValue = secondPosition
        moveAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        // Анимация размера
        let firstScale: CGFloat = 1
        let secondScale: CGFloat = 1.5
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = firstScale
        scaleAnimation.toValue = secondScale
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        // Группировка анимаций
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [colorAnimation, moveAnimation, scaleAnimation]
        groupAnimation.duration = 1.0
        groupAnimation.autoreverses = true
        groupAnimation.repeatCount = 2
        greenView.layer.add(groupAnimation, forKey: "groupAnimation")
    }
}
