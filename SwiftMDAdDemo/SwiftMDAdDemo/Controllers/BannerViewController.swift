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
    
    var adModel: Banner = Banner(title: "", adsID: "")
    
    @IBOutlet weak var bannerViewHeightConstraint: NSLayoutConstraint!
    fileprivate var ratio: CGFloat = 640.0 / 60.0
    
    // 这里为了便于展示, RYBannerView 的实例均采用 Interface Builder 来快速构建视图. 开发者可自行选择初始化方式.
    @IBOutlet weak var bannerView: RYBannerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = adModel.title
        
        switch adModel.adsID {
        
        // 纯图模式, adsID 为 820001, 广告位尺寸是 640.0 : 60.0 (请初始化 bannerView 初始宽高比为 640.0 : 60.0)
        case "820001":
            ratio = 640.0 / 60.0
            
            bannerView.adsID = "820001"
            bannerView.rootViewController = self
            bannerView.delegate = self
            bannerView.loadRequest()
        
        // 左图右文模式, adsID 为 820004, 广告位尺寸是 690.0 : 100.0 (请初始化 bannerView 初始宽高比为 690.0 : 100.0)
        case "820004":
            ratio = 690.0 / 100.0
            
            bannerView.adsID = "820004"
            bannerView.rootViewController = self
            bannerView.delegate = self
            bannerView.loadRequest()
            
        // 纯图模式, adsID 为 820005, 广告位尺寸是 640.0 : 150.0 (请初始化 bannerView 初始宽高比为 640.0 : 150.0)
        case "820005":
            ratio = 640.0 / 150.0
            
            bannerView.adsID = "820005"
            bannerView.rootViewController = self
            bannerView.delegate = self
            bannerView.loadRequest()
            
        default: break
        }
        
        // Other customized settings
        bannerView.alpha = 0.3
        /*
        bannerView.isShowCloseButton = false
        bannerView.isShowDownloadButton = false
        */
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if bannerView == nil { return }
        
        bannerViewHeightConstraint.constant = bannerView.bounds.width / ratio
        bannerView.updateConstraintsIfNeeded()
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
    
    func bannerDidFailToReceiveAd(_ bannerView: RYBannerView, error: RYError) {
        let alertVC = UIAlertController(title: "检测返回异常", message: error.errorDescription ?? "无详细错误信息", preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { _ in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

