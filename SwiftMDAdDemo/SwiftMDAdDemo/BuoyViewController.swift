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
    
    /// `RYBuoyView`'s ratio is 110 : 110(Width : Height).
    /// 浮标式广告展示宽高比是 110 : 110
    @IBOutlet weak var buoyView: RYBuoyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "浮标广告示例"
        
        // Required configs - 初始化 RYBuoyView 之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        buoyView.adsID = "860001"
        
        // 2. Required step2: load request
        buoyView.loadRequest()
        
        // Optional configs - 可选配置:
        
        buoyView.delegate = self
        
        // Other customized settings
//        buoyView.backgroundColor = nil
    }
}


// MARK: - RYBuoyViewDelegate

extension BuoyViewController: RYBuoyViewDelegate {
    func buoyDidReceiveAd(_ buoyView: RYBuoyView) {
    }
}

