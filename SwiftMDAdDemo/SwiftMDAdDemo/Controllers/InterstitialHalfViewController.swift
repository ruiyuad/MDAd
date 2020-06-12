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

    var adModel: Banner = Banner(title: "", adsID: "")
    
    @IBOutlet weak var halfInterstitialView: RYInterstitialHalfView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = adModel.title
        // Required configs - 初始化 RYInterstitialHalfView 之后, 必要的配置有:
        
        /// 插屏式广告位展示宽高值推荐为 255.0 * (255.0 + 55.0), 为保证底部 Close 按钮正常显示, 请保证高度始终大于宽度 55.0
        
        // 1. Required step1: configs `AdsID`
        halfInterstitialView.adsID = "840001"
        halfInterstitialView.rootViewController = self
        halfInterstitialView.loadRequest()
        
        // Optional configs - 可选配置:
        halfInterstitialView.delegate = self
        
        // Other customized settings
//        halfInterstitialView.backgroundColor = .groupTableViewBackground
    }
    
}

extension InterstitialHalfViewController: RYInterstitialHalfViewDelegate {
    
    func interstitialHalfDidReceiveAd(_ interstitial: RYInterstitialHalfView) {
        
    }
    
    func interstitialHalfDidFailToReceiveAd(_ interstitial: RYInterstitialHalfView, error: RYError) {
        let alertVC = UIAlertController(title: "检测返回异常", message: error.errorDescription ?? "无详细错误信息", preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { _ in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}
