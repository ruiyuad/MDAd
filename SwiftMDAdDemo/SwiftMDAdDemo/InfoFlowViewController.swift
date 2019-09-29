//
//  InfoFlowViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/7/10.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
    Abstracts: Infomation flow ads demo.
 */

import UIKit
import MDAd

class InfoFlowViewController: UIViewController {
    
    
    @IBOutlet weak var infoFlowViewAspectConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var infoFlowView: RYInfoFlowView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "信息流广告示例"
        
        // Required configs - 初始化 RYInfoFlowView 实例之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        
        // 信息流广告位可选择三种样式. 不同的 AdsID 对应不同样式. 以下分别列举三种信息流广告位的 adsID 和 尺寸.
        
        // 1.1. 纯图模式, adsID 为 850001, 广告位尺寸是 700.0 : 280.0 (请初始化 bannerView 初始宽高比为 700.0 : 280.0)
        // infoFlowView.adsID = "850001"
        
        // 1.2. 左图右文模式, adsID 为 850002, 广告位尺寸是 690.0 : 290.0 (请初始化 bannerView 初始宽高比为 690.0 : 290.0)
         infoFlowView.adsID = "850002"
        
        // 1.3. 上文下图模式, adsID 为 850006, 广告位尺寸是 690.0 : 440.0 (保证高度大于宽度 26.0)
//        infoFlowView.adsID = "850006"
        
        // 2. Required step2: load request
        infoFlowView.loadRequest()
        
        // Optional configs - 可选配置:
        infoFlowView.delegate = self
        
        // Other custimized settings
        infoFlowView.alpha = 0.0
    }
    
}

// MARK: - RYInfoFlowViewDelegate

extension InfoFlowViewController: RYInfoFlowViewDelegate {
    
    func infoFlowDidReceiveAd(_ infoFlowView: RYInfoFlowView) {
        // You can show infoFlowView with simple animation.
        UIView.animate(withDuration: 1.0) {
            self.infoFlowView.alpha = 1.0
        }
    }
    
}
