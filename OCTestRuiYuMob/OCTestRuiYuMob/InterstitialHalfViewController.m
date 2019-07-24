//
//  InterstitialHalfViewController.m
//  OCTestRuiYuMob
//
//  Created by DerekYuYi on 2019/7/16.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Half interstitial ads demo.
 */

#import "InterstitialHalfViewController.h"

@import RuiYuAdMob;

@interface InterstitialHalfViewController ()

/// `RYInterstitialHalfView`'s ratio is 510 : 510(Width : Height).
/// 弹屏式广告展示宽高比是 510 : 510
@property (weak, nonatomic) IBOutlet RYInterstitialHalfView *halfInterstitialView;

@end

@implementation InterstitialHalfViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInterstitialHalfView 实例之后, 必要的配置有:
    
    // 1. Required step1: configs `AdsID`
    self.halfInterstitialView.adsID = @"800004";
    
    // 2. Required step2: load request
    [self.halfInterstitialView loadRequest];
    
    // Optional configs - 可选配置. 这里可以根据业务需要去实现代理方法, 详情代理方法请查阅发布文档.
    
    // self.halfInterstitialView.delegate = self;
    
    // Other customized setting
    self.halfInterstitialView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}


@end
