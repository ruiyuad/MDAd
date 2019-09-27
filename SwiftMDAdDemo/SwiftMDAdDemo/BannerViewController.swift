//
//  BannerViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/6/12.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
    Abstracts: Banner ads demo.
 */

import UIKit
import MDAd

class BannerViewController: UIViewController {
    
    @IBOutlet weak var bannerView: RYBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "横幅广告示例"
        
        // 这里为了便于展示, 采用 Interface Builder 来构建视图.
        
        // Required configs - 初始化 RYBannerView 之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        bannerView.adsID = "820001" // 640.0 : 60.0 (请初始化 bannerView 初始宽高比为 640.0 : 60.0)
        
//        bannerView.adsID = "820004" // 690.0 : 100.0 (请初始化 bannerView 初始宽高比为 690.0 : 100.0)
        
        // 2. Required step2: load request
        bannerView.loadRequest()
        
        // Optional configs - 可选配置:
        
        bannerView.delegate = self
        
        // Other customized settings
        bannerView.alpha = 0.3
    }
}

// MARK: - RYBannerViewDelegate

extension BannerViewController: RYBannerViewDelegate {
    
    func bannerDidReceiveAd(_ bannerView: RYBannerView) {
        // You can show bannerView with animation.
        // 你可以在收到信息流广告后, 在这里使用动画来展示它
        UIView.animate(withDuration: 1.0) {
            self.bannerView.alpha = 1.0
        }
    }
}

