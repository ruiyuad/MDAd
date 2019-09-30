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
    
    
    @IBOutlet weak var halfInterstitialView: RYInterstitialHalfView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "插屏广告示例"
        // Required configs - 初始化 RYInterstitialHalfView 之后, 必要的配置有:
        
        /// 插屏式广告位展示宽高值推荐为 255.0 * (255.0 + 55.0), 为保证底部 Close 按钮正常显示, 请保证高度始终大于宽度 55.0
        
        // 1. Required step1: configs `AdsID`
        halfInterstitialView.adsID = "840001"
        halfInterstitialView.isShowCloseButton = false
        // 2. Required step2: load request
        halfInterstitialView.loadRequest()
        
        // Optional configs - 可选配置:
        
//        halfInterstitialView.delegate = self
        
        // Other customized settings
//        halfInterstitialView.backgroundColor = .groupTableViewBackground
    }
    
}
