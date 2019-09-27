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
    
    /// `RYInfoFlowView`'s ratio is 750.0 : 1334.0 (Width : Height).
    /// 插页式广告展示宽高比是 750.0 : 1334.0
    @IBOutlet weak var interstitialView: RYInterstitialView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "开屏广告示例"
        skipButton.isHidden = true
        
        // Do any additional setup after loading the view.
        
        // Required configs - 初始化 RYBannerView 之后, 必要的配置有:
        
        // 1. Required step1: configs `AdsID`
        interstitialView.adsID = "810001"
        
        // 2. Required step2: load request
        interstitialView.loadRequest()
        
        // Optional configs - 可选配置:
        
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
    
<<<<<<< Updated upstream
    // MARK: - Actions
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
=======
>>>>>>> Stashed changes
}

// MARK: - RYInterstitialViewDelegate

extension InterstitialViewController: RYInterstitialViewDelegate {
    
    func interstitialCountDownDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
