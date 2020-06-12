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
    
    var adModel: Banner = Banner(title: "", adsID: "")
    
    var isChildViewControllerOfHomePage = false
    
    @IBOutlet weak var interstitialView: RYInterstitialView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = adModel.title
        
        // Required configs - 初始化 RYInterstitialView 之后, 必要的配置有:
        
        switch adModel.adsID {
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
            // 广告位尺寸是 750.0 : 1334.0，底部logo界面高度为屏幕宽度的1/3
            
            interstitialView.adsID = "810002"
            interstitialView.rootViewController = self
            interstitialView.loadRequest()
            interstitialView.delegate = self
            
            /// Only works for interstitial ad which adsID is 810002.
            interstitialView.bottomLogoView = bottomLogoView
            
        default:
            break
        }
    }
    
    private lazy var bottomLogoView: UIView = {
        
        let logoViewHeight: CGFloat = UIScreen.main.bounds.width / 3.0
        let logoImageViewHeight: CGFloat = 40.0
        let logoLabelHeight: CGFloat = 20.0
        let gapBetweenLogoLabelAndLogoImageView: CGFloat = 4.0
        let verticalGap: CGFloat = (logoViewHeight - logoImageViewHeight - logoLabelHeight - gapBetweenLogoLabelAndLogoImageView) / 2.0
        
        let logoView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - logoViewHeight, width: UIScreen.main.bounds.width, height: logoViewHeight))
        
        let logoImageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2.0 - (logoImageViewHeight / 2.0), y: verticalGap, width: logoImageViewHeight, height: logoImageViewHeight))
        logoImageView.image = UIImage(named: "appIcon40")
        logoImageView.layer.cornerRadius = 5.0
        
        let logoTextLabel = UILabel(frame: CGRect(x: 0, y: logoImageView.frame.maxY + gapBetweenLogoLabelAndLogoImageView, width: UIScreen.main.bounds.width, height: logoLabelHeight))
        logoTextLabel.textAlignment = .center
        logoTextLabel.font = UIFont(name: "PingFangSC-Regular", size: 20)
        logoTextLabel.textColor = UIColor.darkText.withAlphaComponent(0.6)
        logoTextLabel.text = "MDAd，广告展示更优雅"
        
        logoView.addSubview(logoImageView)
        logoView.addSubview(logoTextLabel)
        
        return logoView
    }()
    
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
