//
//  HomePage.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/10/23.
//  Copyright © 2019 RuiYu. All rights reserved.
//

import UIKit

class HomePage: UITableViewController {
    
    fileprivate let ads: [[String: [Banner]]] = [["Banner 广告": [Banner(title: "纯图类型", adsID: "820001"),
                                                                 Banner(title: "左图右文类型", adsID: "820004")]],
                                                 ["信息流广告": [Banner(title: "上文下图带底部阴影类型", adsID: "850006"),
                                                               Banner(title: "上图下文类型", adsID: "850009"),
                                                               Banner(title: "左图右文类型(1:1.3)", adsID: "850008")]],
                                                 ["开屏广告":[Banner(title: "全屏广告类型", adsID: "810001")]],
                                                 ["插屏广告":[Banner(title: "插屏广告类型", adsID: "840001")]],
                                                 ["浮标广告":[Banner(title: "浮标广告类型", adsID: "860001")]],
                                                 ["自定义广告":[Banner(title: "自定义广告类型", adsID: "-")]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ads.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard ads.count > section else { return 0 }
        return ads[section].values.first!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        if let detailsAds = ads[indexPath.section].values.first, detailsAds.count > 0, indexPath.row < detailsAds.count {
            let ad = detailsAds[indexPath.row]
            cell.textLabel?.text = ad.title + " (\(ad.adsID))"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 38.0))
        view.backgroundColor = .groupTableViewBackground
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: view.bounds.width - 16*2, height: view.bounds.height))
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = ads[section].keys.first ?? ""
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        switch ads[indexPath.section].keys.first {
        case "Banner 广告":
            if let bannerVC = main.instantiateViewController(withIdentifier: "BannerViewController") as? BannerViewController {
                bannerVC.adsID = ads[indexPath.section].values.first![indexPath.row].adsID
                navigationController?.pushViewController(bannerVC, animated: true)
            }
            
        case "信息流广告":
            if let infoflowVC = main.instantiateViewController(withIdentifier: "InfoFlowViewController") as? InfoFlowViewController {
                infoflowVC.adsID = ads[indexPath.section].values.first![indexPath.row].adsID
                navigationController?.pushViewController(infoflowVC, animated: true)
            }
            
        case "开屏广告":
            if let interstitialVC = main.instantiateViewController(withIdentifier: "InterstitialViewController") as? InterstitialViewController {
                navigationController?.pushViewController(interstitialVC, animated: true)
            }
            
        case "插屏广告":
            if let interstitialHalfVC = main.instantiateViewController(withIdentifier: "InterstitialHalfViewController") as? InterstitialHalfViewController {
                navigationController?.pushViewController(interstitialHalfVC, animated: true)
            }
            
        case "浮标广告":
            if let buoyVC = main.instantiateViewController(withIdentifier: "BuoyViewController") as? BuoyViewController {
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
