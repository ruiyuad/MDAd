//
//  InterstitialViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/7/11.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
    Abstracts: Interstitial ads demo.
*/

import UIKit
import MDAd

class InterstitialViewController: UIViewController {
    
    var adsID: String = "810001"
    var isChildViewControllerOfHomePage = false
    
    
    @IBOutlet weak var interstitialView: RYInterstitialView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "开屏广告示例"
        
        // Required configs - 初始化 RYInterstitialView 之后, 必要的配置有:
        
        switch adsID {
        case "810001":
            // 纯图模式, adsID 为 810001
            // 广告位尺寸是 750.0 : 1334.0
            interstitialView.adsID = "810001"
            interstitialView.rootViewController = self
            // 设置广告链接跳转方式为应用外打开
            interstitialView.needOpenAdsLinkFromWithinCurrentApp = false
            interstitialView.loadRequest()
            interstitialView.delegate = self
            
        case "810002":
            // 上图下文模式, adsID 为 810002
            // 广告位尺寸是 750.0 : 1143.0
            
            interstitialView.adsID = "810002"
            interstitialView.rootViewController = self
            interstitialView.loadRequest()
            interstitialView.delegate = self
            
            /// Only works for interstitial ad which adsID is 810002.
            
            interstitialView.config(appLogo: UIImage(named: "appIcon40"), appName: "妙招助手, 活出每一个细节")
            interstitialView.logoCornerRadius = 5.0
//            interstitialView.logoTextFont = UIFont(name: "PingFangSC-Regular", size: 20)
//            interstitialView.logoTextColor = UIColor.darkText
            
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

// MARK: - RYInterstitialViewDelegate

extension InterstitialViewController: RYInterstitialViewDelegate {
    
    func interstitialDidReceiveAd(_ interstitial: RYInterstitialView) {
        debugPrint("Received the interstitial ad.")
    }
    
    func interstitialDidFailToReceiveAd(_ interstitial: RYInterstitialView, error: RYError) {
        let alertVC = UIAlertController(title: "检测返回异常", message: error.errorDescription ?? "无详细错误信息", preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { _ in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
    
    func interstitialCountDownDidTap() {
        if isChildViewControllerOfHomePage {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.9, animations: {
                    self.view.alpha = 0.0
                }) { _ in
                    self.view.isHidden = true
                    self.view.removeFromSuperview()
                    self.removeFromParent()
                }
            }
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
