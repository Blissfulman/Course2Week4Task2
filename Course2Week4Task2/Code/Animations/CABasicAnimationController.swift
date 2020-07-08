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
        let firstColor = greenView.backgroundColor!
        let secondColor = UIColor.magenta
        let colorAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        colorAnimation.values = [firstColor.cgColor, secondColor.cgColor, firstColor.cgColor, secondColor.cgColor, firstColor.cgColor]
        colorAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        colorAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]

        // Анимация движения
        let firstPosition = greenView.center
        let secondPosition = view.center
        let moveAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        moveAnimation.values = [firstPosition, secondPosition, firstPosition, secondPosition, firstPosition]
        moveAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        moveAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                         CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                         CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                         CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        
        // Анимация размера
        let firstScale: CGFloat = 1
        let secondScale: CGFloat = 1.5
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.values = [firstScale, secondScale, firstScale, secondScale, firstScale]
        scaleAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        
        // Группировка анимаций
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [colorAnimation, moveAnimation, scaleAnimation]
        groupAnimation.duration = 4.0
        greenView.layer.add(groupAnimation, forKey: "groupAnimation")
    }
}
