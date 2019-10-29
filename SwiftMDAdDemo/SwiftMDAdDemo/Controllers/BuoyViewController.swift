//
//  BuoyViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/7/18.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Buoy ads demo.
 */

import UIKit
import MDAd

class BuoyViewController: UIViewController {
    
    @IBOutlet weak var buoyView: RYBuoyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "浮标广告示例"
        
        // Required configs - 初始化 RYBuoyView 之后, 必要的配置有:
        
        /// `RYBuoyView`'s ratio is 110 : 110(Width : Height).
        /// 浮标式广告展示宽高比是 110 : 110
        
        // 1. Required configs: `AdsID`、`rootViewController`
        buoyView.adsID = "860001"
        buoyView.rootViewController = self
        buoyView.delegate = self
        buoyView.loadRequest()
        
        // Optional configs - 可选配置:
//        buoyView.isShowCloseButton = false
    }
}


// MARK: - RYBuoyViewDelegate

extension BuoyViewController: RYBuoyViewDelegate {
    func buoyDidReceiveAd(_ buoyView: RYBuoyView) {
    }
}

