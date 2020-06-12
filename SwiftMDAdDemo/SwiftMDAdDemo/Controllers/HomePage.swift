//
//  HomePage.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/10/23.
//  Copyright © 2019 RuiYu. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    fileprivate let ads: [[String: [Banner]]] = [
        
        ["开屏广告": [Banner(title: "开屏-单图0.56", adsID: "810001"),
                         Banner(title: "开屏-上图下logo0.7", adsID: "810002")]],
        
        ["Banner广告": [Banner(title: "Banner-单图10.67", adsID: "820001"),
                           Banner(title: "Banner-左图右文1.56", adsID: "820004"),
                           Banner(title: "Banner-单图4.26", adsID: "820005")]],
        
        ["插屏广告": [Banner(title: "插屏广告", adsID: "840001")]],
        
        ["信息流广告": [Banner(title: "信息流-左图右文0.67", adsID: "850002"),
                             Banner(title: "信息流-上文下图1.78", adsID: "850006"),
                             Banner(title: "信息流-左文右图0.78", adsID: "850007"),
                             Banner(title: "信息流-左图右文0.78", adsID: "850008"),
                             Banner(title: "信息流-上图下文1.78", adsID: "850009"),
                             Banner(title: "信息流-左图右文1.5", adsID: "850010"),
                             Banner(title: "信息流-左文右图1.5", adsID: "850011")]],
        
        ["浮标广告": [Banner(title: "浮标广告", adsID: "860001")]],
        
        ["自定义广告": [Banner(title: "自定义广告", adsID: "-")]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        // Add InterstitialViewController as full screen ad
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let interstitialVC = main.instantiateViewController(withIdentifier: "InterstitialViewController") as? InterstitialViewController {
            interstitialVC.isChildViewControllerOfHomePage = true
            interstitialVC.adModel = Banner(title: "开屏-上图下logo0.7", adsID: "810002")
            addChild(interstitialVC)
            
            view.addSubview(interstitialVC.view)
        }
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard ads.count > section else { return 0 }
        return ads[section].values.first!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        if let detailsAds = ads[indexPath.section].values.first, detailsAds.count > 0, indexPath.row < detailsAds.count {
            let ad = detailsAds[indexPath.row]
            cell.textLabel?.text = ad.title + " (\(ad.adsID))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 38.0))
        view.backgroundColor = .groupTableViewBackground
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: view.bounds.width - 16*2, height: view.bounds.height))
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = ads[section].keys.first ?? ""
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        switch ads[indexPath.section].keys.first {
        case "Banner广告":
            if let bannerVC = main.instantiateViewController(withIdentifier: "BannerViewController") as? BannerViewController {
                bannerVC.adModel = ads[indexPath.section].values.first![indexPath.row]
                navigationController?.pushViewController(bannerVC, animated: true)
            }
            
        case "信息流广告":
            if let infoflowVC = main.instantiateViewController(withIdentifier: "InfoFlowViewController") as? InfoFlowViewController {
                infoflowVC.adModel = ads[indexPath.section].values.first![indexPath.row]
                navigationController?.pushViewController(infoflowVC, animated: true)
            }
            
        case "开屏广告":
            if let interstitialVC = main.instantiateViewController(withIdentifier: "InterstitialViewController") as? InterstitialViewController {
                interstitialVC.adModel = ads[indexPath.section].values.first![indexPath.row]
                navigationController?.pushViewController(interstitialVC, animated: true)
            }
            
        case "插屏广告":
            if let interstitialHalfVC = main.instantiateViewController(withIdentifier: "InterstitialHalfViewController") as? InterstitialHalfViewController {
                interstitialHalfVC.adModel = ads[indexPath.section].values.first![indexPath.row]
                navigationController?.pushViewController(interstitialHalfVC, animated: true)
            }
            
        case "浮标广告":
            if let buoyVC = main.instantiateViewController(withIdentifier: "BuoyViewController") as? BuoyViewController {
                buoyVC.adModel = ads[indexPath.section].values.first![indexPath.row]
                navigationController?.pushViewController(buoyVC, animated: true)
            }
            
        case "自定义广告":
            if let customBannerVC = main.instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController {
                navigationController?.pushViewController(customBannerVC, animated: true)
            }
            
        default: break
        }
    }
}


struct Banner {
    let title: String
    let adsID: String
}
