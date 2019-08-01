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

    /// `RYInfoFlowView`'s ratio is 700 : 280 (Width : Height).
    ///  信息流广告展示宽高比是 700 : 280
    @IBOutlet weak var infoFlowView: RYInfoFlowView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "信息流广告示例"
        
        // Required configs - 初始化 RYInfoFlowView 实例之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        infoFlowView.adsID = "800005"
        
        // 2. Required step2: load request
        infoFlowView.loadRequest()
        
        // Optional configs - 可选配置:
        infoFlowView.delegate = self
        
        // Other custimized setting
        infoFlowView.alpha = 0.0
    }

}

// MARK: - RYInfoFlowViewDelegate

extension InfoFlowViewController: RYInfoFlowViewDelegate {
    
    func infoFlowViewDidReceiveAd(_ infoFlowView: RYInfoFlowView) {
        // You can show infoFlowView with animation.
        // 你可以在收到信息流广告后, 在这里使用动画来展示它
        UIView.animate(withDuration: 1.0) {
            self.infoFlowView.alpha = 1.0
        }
    }
    
}
