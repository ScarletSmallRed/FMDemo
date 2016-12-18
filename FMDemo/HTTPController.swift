//
//  HTTPController.swift
//  FMDemo
//
//  Created by 沈韶泓 on 2016/12/18.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class HTTPController: NSObject {
    
    var delegate: HTTPProtocol?
    
    func onSearch(_ url: String) {
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let json = response.result.value {
                self.delegate?.didReceiveResults(json)
            }
        }
    }
}

protocol HTTPProtocol {
    func didReceiveResults(_ results: Any)
}
