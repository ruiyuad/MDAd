//
//  InterstitialHalfViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/7/16.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Half interstitial ads demo.
 */

#import "InterstitialHalfViewController.h"

@import MDAd;

@interface InterstitialHalfViewController ()

@property (weak, nonatomic) IBOutlet RYInterstitialHalfView *halfInterstitialView;

@end

@implementation InterstitialHalfViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInterstitialHalfView 实例之后, 必要的配置有:
    
    /// 插屏式广告位展示宽高值推荐为 255.0 * (255.0 + 55.0), 为保证底部 Close 按钮正常显示, 请保证高度始终大于宽度 55.0
    
    // 1. Required step1: configs `AdsID`
    self.halfInterstitialView.adsID = @"840001";
    
    // 2. Required step2: load request
    [self.halfInterstitialView loadRequest];
    
    // Optional configs - 可选配置.
    
    // self.halfInterstitialView.delegate = self;
    
    // Other customized setting
}


@end
