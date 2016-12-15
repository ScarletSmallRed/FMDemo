//
//  ViewController.swift
//  FMDemo
//
//  Created by 沈韶泓 on 2016/12/14.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iv: EkoImage!
    @IBOutlet weak var bg: EkoImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        iv.onRotation()
        bg.blurImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

