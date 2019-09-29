//
//  BannerViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/6/13.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Banner ads demo.
 */

#import "BannerViewController.h"

@import MDAd;

@interface BannerViewController ()<RYBannerViewDelegate>

/// `RYBannerView`'s ratio is 700 : 280(Width : Height).
/// 横幅广告展示宽高比是 700 : 280.
@property (weak, nonatomic) IBOutlet RYBannerView *bannerView;


@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这里为了便于展示, 采用 Interface Builder 来构建视图.
    
    // Required configs - 初始化 RYBannerView 实例之后, 必要的配置有:
    
    // 横幅广告位可选择两种样式. 不同的 AdsID 对应不同样式. 以下分别列举三种信息流广告位的 adsID 和 尺寸. 每次请选择一种样式展示.
    
    // 1. Required step1: configs `AdsID`
    
    // 1.1. 纯图模式, adsID 为 820001, 广告位尺寸是 640.0 : 60.0 (请初始化 bannerView 初始宽高比为 640.0 : 60.0)
    self.bannerView.adsID = @"820001";
    
    // 1.2. 左图右文模式, adsID 为 820004, 广告位尺寸是 690.0 : 100.0 (请初始化 bannerView 初始宽高比为 690.0 : 100.0)
//    self.bannerView.adsID = @"820004";
    
    // 2. Required step2: load request
    [self.bannerView loadRequest];
    
    // Optional configs - 可选配置:
    
    self.bannerView.delegate = self;
}


#pragma mark - RYBannerViewDelegate

- (void)adViewDidReceiveAd:(RYBannerView *)bannerView {
}

@end
