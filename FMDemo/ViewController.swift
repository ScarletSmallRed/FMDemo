//
//  ViewController.swift
//  FMDemo
//
//  Created by 沈韶泓 on 2016/12/14.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var iv: EkoImage!
    @IBOutlet weak var bg: EkoImage!
    @IBOutlet weak var tv: UITableView!
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "SongCell")! as UITableViewCell
        
        cell.textLabel?.text = NSLocalizedString("Title: \(indexPath.row)", comment: "Song cell title")
        cell.detailTextLabel?.text = NSLocalizedString("Subtitle: \(indexPath.row)", comment: "Song cell subtitle")
        
        cell.imageView?.image = UIImage(named: "thumb")
        
        return cell
    }
}

