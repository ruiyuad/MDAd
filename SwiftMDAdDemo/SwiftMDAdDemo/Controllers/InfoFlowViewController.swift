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
    
    // MARK: - Properties
    
    var adsID: String = "850001"
    
    @IBOutlet weak var infoFlowViewHeightConstraint: NSLayoutConstraint!
    fileprivate var ratio: CGFloat = 700.0 / 280.0
    fileprivate var extraHeight: CGFloat = 0.0
    
    @IBOutlet weak var infoFlowView: RYInfoFlowView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "信息流广告示例"
        
        // Required configs - 初始化 RYInfoFlowView 实例之后, 必要的配置有:
        
        // 信息流广告位可选择6种样式. 不同的 AdsID 对应不同样式. 以下分别列举6种信息流广告位的 adsID 和 尺寸.
        
        switch adsID {
        case "850001":
            // 纯图模式, adsID 为 850001,
            // 广告位尺寸是 700.0 : 280.0 (请初始化 infoFlowView 初始宽高比为 700.0 : 280.0)
            infoFlowView.adsID = "850001"
            ratio = 700.0 / 280.0
            infoFlowView.rootViewController = self
            infoFlowView.delegate = self
            infoFlowView.loadRequest()
            
        case "850002":
            // 左图右文模式, adsID 为 850002,
            // 广告位尺寸是 690.0 : 290.0, 广告图片比例是 576: 386(请初始化 infoFlowView 初始宽高比为 690.0 : 290.0)
            infoFlowView.adsID = "850002"
            ratio = 690.0 / 290.0
            infoFlowView.rootViewController = self
            infoFlowView.delegate = self
            infoFlowView.loadRequest()
            
        case "850006":
            // 上文下图无底部浮层模式, adsID 为 850006, 广告位尺寸是 690.0 : 440.0
            infoFlowView.adsID = "850006"
            ratio = 686.0 / 386.0
            // 上文下图无底部浮层模式, 配置 isShowDescriptionText 为 true, 打开浮层模式, 否则关闭, 默认关闭
            infoFlowView.isShowDescriptionText = true
            infoFlowView.rootViewController = self
            infoFlowView.delegate = self
            infoFlowView.loadRequest()
            
            extraHeight = 26
            
        case "850008":
            // 左图右文模式, adsID 为 850008,
            // 广告位尺寸是 690.0 : 290.0, 广告图片比例是 140: 180 (请初始化 infoFlowView 初始宽高比为 690.0 : 290.0)
            infoFlowView.adsID = "850008"
            ratio = 690.0 / 290.0
            infoFlowView.rootViewController = self
            infoFlowView.delegate = self
            infoFlowView.loadRequest()
            
        case "850009":
            // 上图下文模式, adsID 为 850009, 广告位尺寸是 690.0 : 440.0
            infoFlowView.adsID = "850009"
            ratio = 686.0 / 386.0
            infoFlowView.rootViewController = self
            infoFlowView.delegate = self
            infoFlowView.loadRequest()
            
            extraHeight = 26
            
        case "850011":
            // 三图模式, adsID 为 850011, 广告位尺寸是 320.0 / 125.0
            infoFlowView.adsID = "850011"
            ratio = 320.0 / 125.0
            infoFlowView.rootViewController = self
            infoFlowView.delegate = self
            infoFlowView.loadRequest()
            
        default:
            break
        }
        
        // 其他可选配置项: isShowCloseButton, isShowDownloadButton, ...
//        infoFlowView.isShowCloseButton = false
//        infoFlowView.isShowDownloadButton = false
        
        // Other custimized settings
        infoFlowView.alpha = 0.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if infoFlowView == nil { return }
        
        infoFlowViewHeightConstraint.constant = infoFlowView.bounds.width / ratio + extraHeight
        infoFlowView.updateConstraintsIfNeeded()
    }
    
}


// MARK: - RYInfoFlowViewDelegate

extension InfoFlowViewController: RYInfoFlowViewDelegate {
    
    func infoFlowDidReceiveAd(_ infoFlowView: RYInfoFlowView) {
        // You can show infoFlowView with simple animation.
        UIView.animate(withDuration: 1.0) {
            self.infoFlowView.alpha = 1.0
        }
        
        /*
        UIView.animate(withDuration: 1.0, animations: {
            self.infoFlowView.alpha = 1.0
        }) { _ in
            infoFlowView.isShowCloseButton = true
            infoFlowView.isShowDownloadButton = true
            infoFlowView.isShowDescriptionText = false
        }
        */
    }
    
    func infoFlowDidFailToReceiveAd(_ infoFlowView: RYInfoFlowView, error: RYError) {
        
        let alertVC = UIAlertController(title: "检测返回异常", message: error.errorDescription ?? "无详细错误信息", preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { _ in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}
