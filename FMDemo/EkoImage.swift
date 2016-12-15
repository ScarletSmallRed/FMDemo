//
//  EkoImage.swift
//  FMDemo
//
//  Created by 沈韶泓 on 2016/12/15.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class EkoImage: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func onRotation() {
        
        self.layer.cornerRadius = self.frame.size.width / 2
        //        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7).cgColor

        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.fromValue = 0.0
        
        animation.toValue = M_PI * 2.0
        
        animation.duration = 20
        
        animation.repeatCount = 10000
        
        self.layer.add(animation, forKey: nil)
    }
    
    func blurImage() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = (superview?.frame)!
        self.addSubview(blurView)
    }
}
