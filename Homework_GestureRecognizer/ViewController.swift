//
//  ViewController.swift
//  Homework_GestureRecognizer
//
//  Created by Vlad on 2.12.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movingView: UIView!
    
    @IBOutlet weak var staticView: UIView!
    
    @IBOutlet weak var startAgain: UIButton!
    
    var originalPointMovingView: CGRect!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        movingView.layer.cornerRadius = movingView.frame.height / 2
//        staticView.layer.cornerRadius = staticView.frame.height / 2
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureMoved))
        
        movingView.addGestureRecognizer(gestureRecognizer)
        originalPointMovingView = self.movingView.frame
        
        startAgain.isHidden = true

    }
    
    @objc func panGestureMoved(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: view)
        
        movingView.center = CGPoint(x: movingView.center.x + point.x,
                                    y: movingView.center.y + point.y)
        
        sender.setTranslation(.zero, in: view)
        
        if movingView.frame.intersects(staticView.frame) == true {
            sender.state = .ended
            startAgain.isHidden = false
        }
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        movingView.frame = originalPointMovingView
        startAgain.isHidden = true
    }
    
}

