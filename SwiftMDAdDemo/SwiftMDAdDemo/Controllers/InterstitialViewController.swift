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
    
    @IBOutlet weak var interstitialView: RYInterstitialView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "开屏广告示例"
        
        // Do any additional setup after loading the view.
        
        // Required configs - 初始化 RYInterstitialView 之后, 必要的配置有:
        
        /// `RYInterstitialView`'s ratio is 750.0 : 1334.0 (Width : Height).
        /// 插页式广告展示宽高比是 750.0 : 1334.0
        
        interstitialView.adsID = "810001"
        interstitialView.rootViewController = self
        interstitialView.loadRequest()
        interstitialView.delegate = self
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
        navigationController?.popViewController(animated: true)
    }
}
