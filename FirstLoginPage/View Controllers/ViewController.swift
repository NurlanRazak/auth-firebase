//
//  ViewController.swift
//  FirstLoginPage
//
//  Created by Нурлан Разак on 9/23/19.
//  Copyright © 2019 develops. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        setUpVideo()
    }
    
//    func setUpVideo() {
//
//        let bundlePath = Bundle.main.path(forResource:"feat", ofType:"mp4")
//
//        guard bundlePath != nil else {
//            return
//        }
//
//        let url = URL(fileURLWithPath: bundlePath!)
//
//        let item  = AVPlayerItem(url: url)
//
//        videoPlayer = AVPlayer(playerItem: item)
//
//        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
//
//        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
//
//        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
//
//        videoPlayer?.playImmediately(atRate: 1)
//
//    }
    

}

