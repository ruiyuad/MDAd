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
    
    /// `RYBannerView`'s ratio is 700:280(Width : Height).
    /// 横幅广告展示宽高比是 700 : 280
    @IBOutlet weak var bannerView: RYBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "横幅广告示例"
        
        // 这里为了便于展示, 采用 Build Interface 来构建视图.
        
        // Required configs - 初始化 RYBannerView 之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        bannerView.adsID = "800003"
        
        // 2. Required step2: load request
        bannerView.loadRequest()
        
        // Optional configs - 可选配置:
        
        bannerView.delegate = self
        
        // Other customized setting
        bannerView.alpha = 0.3
        bannerView.backgroundColor = .groupTableViewBackground
    }
    
}

// MARK: - RYBannerViewDelegate

extension BannerViewController: RYBannerViewDelegate {
    
    func adViewDidReceiveAd(_ bannerView: RYBannerView) {
        // You can show bannerView with animation.
        // 你可以在收到信息流广告后, 在这里使用动画来展示它
        UIView.animate(withDuration: 1.0) {
            self.bannerView.alpha = 1.0
        }
    }
    
}

