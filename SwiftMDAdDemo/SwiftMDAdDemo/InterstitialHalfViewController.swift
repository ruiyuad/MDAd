//
//  InterstitialHalfViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/7/17.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
    Abstracts: Half Interstitial ads demo.
 */

import UIKit
import MDAd

class InterstitialHalfViewController: UIViewController {
    
    /// `RYInterstitialHalfView`'s ratio is 510:510(Width : Height).
    /// 插屏式广告展示宽高比是 510 : 510
    @IBOutlet weak var halfInterstitialView: RYInterstitialHalfView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "插屏广告示例"
        // Required configs - 初始化 RYInterstitialHalfView 之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        halfInterstitialView.adsID = "800004"
        
        // 2. Required step2: load request
        halfInterstitialView.loadRequest()
        
        // Optional configs - 可选配置:
        
        halfInterstitialView.delegate = self
        
        // Other customized setting
        
        halfInterstitialView.backgroundColor = .groupTableViewBackground
    }
    
}

// MARK: - RYInterstitialViewDelegate

extension InterstitialHalfViewController: RYInterstitialHalfViewDelegate {
    func interstitialHalfDidReceiveAd(_ interstitial: RYInterstitialHalfView) {
    }
}
