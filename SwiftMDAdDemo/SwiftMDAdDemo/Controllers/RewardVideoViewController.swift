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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openRewardVideo(_ sender: UIButton) {

        /// 不要全局持有 `RYRewardVideoViewController`的实例, 每个实例管理一次完整的视频加载生命周期.
        let rewardVideoVC = RYRewardVideoViewController()
        rewardVideoVC.adsID = "870001"
        rewardVideoVC.needDisplayBackgroundImageView = true
        rewardVideoVC.delegate = self
        rewardVideoVC.loadRequest()
        present(rewardVideoVC, animated: true, completion: nil)
    }
    
}


extension RewardVideoViewController: RYRewardVideoViewControllerDelegate {
    
    func rewardVideoDidReceiveAd(_ controller: RYRewardVideoViewController) {
        debugPrint("reward video received successfully")
    }
    
    func rewardVideoDidFailToReceiveAd(_ controller: RYRewardVideoViewController, error: RYError) {
        debugPrint("Reward video received failed and the error info is \(error.errorDescription ?? "无详细错误信息")")
    }
    
    func RewardVideoWillClose() {
        dismiss(animated: true, completion: nil)
    }
}
