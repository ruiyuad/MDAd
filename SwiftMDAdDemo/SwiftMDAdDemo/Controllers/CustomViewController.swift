//
//  CustomViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/10/18.
//  Copyright © 2019 RuiYu. All rights reserved.
//

import UIKit
import MDAd

/**
 Abstract: 演示自定义广告类 `RYCustomAd` 的使用.
 */

class CustomViewController: UIViewController {
    
    /// 你可以选择不同的广告类型进行自定义, 比如 Banner 广告, 信息流广告, 全屏广告等, 详情请看 `BannerViewController`, `InfoFlowViewController`, `InterstitialViewController` 等.
    /// 这里选择信息流广告类型(850008) 来进行自定义展示.
    fileprivate let customAd = RYCustomAd(adsID: "850008")
    
    /// 自定义广告对应的广告图片的比例. 注意: 在进行自定义广告时, 请务必保证自定义图片的比例与对应广告类型图片比例保持一致.
    fileprivate let imageViewRatioForCustomAd: CGFloat = 140.0 / 180.0
    
    /// 广告自定义视图, 你可以开发你所需要的自定义设计. 这里以 `CustomView` 为例.
    fileprivate let customView = CustomView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "自定义广告示例"
        
        // add CustomView
        view.addSubview(customView)
        customView.delegate = self

        // config instance of RYCustomAd
        customAd.rootViewController = self
        customAd.delegate = self
        customAd.loadRequest()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 100)
    }
}

// MARK: - RYCustomAdDelegate

extension CustomViewController: RYCustomAdDelegate {
    func customAdDidReceiveAd(_ customAd: RYCustomAd, receivedData infos: [String : String]) {
        
        // update datasource for customview after received custom ad data.
        customView.update(infos["MDAdKeyForImageUrl"],
                          title: infos["MDAdKeyForTitle"],
                          desc: infos["MDAdKeyForDescription"],
                          imageRatio: imageViewRatioForCustomAd)
    }
    
    func customAdDidFailToReceiveAd(_ customAd: RYCustomAd, error: RYError) {
        let alertVC = UIAlertController(title: "检测返回异常", message: error.errorDescription ?? "无详细错误信息", preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { _ in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

// MARK: - CustomViewDelegate

extension CustomViewController: CustomViewDelegate {
    func adTapped() {
        
        // open ad link.
        // called when you add gestures, actions or other Selectors to you custom ad view
        customAd.openAdLink()
    }
}
