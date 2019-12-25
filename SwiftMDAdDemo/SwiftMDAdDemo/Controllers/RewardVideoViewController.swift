//
//  RewardVideoViewController.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/11/5.
//  Copyright © 2019 RuiYu. All rights reserved.
//

import UIKit
import MDAd

class RewardVideoViewController: UIViewController {
    
    fileprivate let rewardVideoVC = RYRewardVideoViewController()
    
    /// 默认第一次进入页面预加载视频.
    /// 如果后续需要在当前页面多次加载视频, 请在第一次预加载成功后, 设置为 false.
    var isPreLoadRewardVideo = true
    
    deinit {
        rewardVideoVC.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardVideoVC.adsID = "870001"
        rewardVideoVC.needDisplayBackgroundImageView = true
        rewardVideoVC.delegate = self
        rewardVideoVC.loadRequest()
    }
    
    @IBAction func openRewardVideo(_ sender: UIButton) {
        if !isPreLoadRewardVideo {
            rewardVideoVC.loadRequest()
        }
        rewardVideoVC.modalPresentationStyle = .fullScreen
        present(rewardVideoVC, animated: true, completion: nil)
        isPreLoadRewardVideo = false
        
        /*
        第二种加载方式
        在每个场景直接创建局部 `RYRewardVideoViewController`的实例, 每个实例管理一次完整的视频加载生命周期.
        let rewardVideoVC = RYRewardVideoViewController()
        rewardVideoVC.adsID = "870001"
        rewardVideoVC.needDisplayBackgroundImageView = true
        rewardVideoVC.delegate = self
        rewardVideoVC.loadRequest()
        present(rewardVideoVC, animated: true, completion: nil)
        */
    }
    
}


extension RewardVideoViewController: RYRewardVideoViewControllerDelegate {
    
    func rewardVideoDidReceiveAd(_ controller: RYRewardVideoViewController) {
        debugPrint("reward video received successfully")
    }
    
    func rewardVideoDidFailToReceiveAd(_ controller: RYRewardVideoViewController, error: RYError) {
        debugPrint("Reward video received failed and the error info is \(error.errorDescription ?? "无详细错误信息")")
    }
    
    func rewardVideoIsReadyForPlay(_ controller: RYRewardVideoViewController, isReadyForPlay isReady: Bool) {
        if isReady {
            debugPrint("rewardVideoIsReadyForPlay")
        }
    }
    
    func rewardVideoWillClose() {
        dismiss(animated: true, completion: nil)
    }
    
}
