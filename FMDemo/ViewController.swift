//
//  ViewController.swift
//  FMDemo
//
//  Created by 沈韶泓 on 2016/12/14.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HTTPProtocol, ChannelProtocol {
    
    @IBOutlet weak var iv: EkoImage!
    @IBOutlet weak var bg: EkoImage!
    @IBOutlet weak var tv: UITableView!
    
    var httpController = HTTPController()
    
    var songData: [JSON] = []
    
    var channelData: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        httpController.delegate = self
        
        httpController.onSearch("http://www.douban.com/j/app/radio/channels")
        httpController.onSearch("https://douban.fm/j/mine/playlist?type=n&channel=100&from=mainsite")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        iv.onRotation()
        bg.blurImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "SongCell")! as UITableViewCell
        
        let rowData: JSON = songData[indexPath.row]
        
        cell.textLabel?.text = rowData["title"].string
        
        cell.detailTextLabel?.text = rowData["artist"].string
        
        let url = rowData["picture"].string
        
        Alamofire.request(url!, method: .get).responseJSON { (response) in
            cell.imageView?.image = UIImage(data: response.data! as Data)
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var channelTC: ChannelTableViewController = segue.destination as! ChannelTableViewController
        channelTC.delegate = self
        channelTC.channelData = self.channelData
    }
    
    
    // MARK: - HTTP protocol
    
    func didReceiveResults(_ results: Any) {
        print("results: \(results)")
        let json = JSON(results)
        print("json: \(json)")
        
        if let channels = json["channels"].array {
            self.channelData = channels
            print("channels: \(channels)")
            print("length: \(channels.count)")
        } else if let songs = json["song"].array {
            self.songData = songs
            print("songs: \(songs)")
            print("length: \(songs.count)")
            self.tv.reloadData()
        }
    }
    
    // MARK: - Channle protocol
    func onChangeChannel(channelID: String) {
        let url: String = "https://douban.fm/j/mine/playlist?type=n&channel=\(channelID)&from=mainsite"
        httpController.onSearch(url)
    }
}

