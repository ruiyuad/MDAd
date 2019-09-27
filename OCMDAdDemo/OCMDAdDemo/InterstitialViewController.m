//
//  InterstitialViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/7/16.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Interstitial ads demo.
 */

#import "InterstitialViewController.h"

@import MDAd;

@interface InterstitialViewController ()<RYInterstitialViewDelegate>

/// `RYInfoFlowView`'s ratio is 750 : 1334(Width : Height).
/// 插页式广告展示宽高比是 750 : 1334
@property (weak, nonatomic) IBOutlet RYInterstitialView *interstitialView;

@end

@implementation InterstitialViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInterstitialView 实例之后, 必要的配置有:
    
    // 1. Required step1: configs `AdsID`
    self.interstitialView.adsID = @"810001";
    
    // 2. Required step2: load request
    [self.interstitialView loadRequest];
    
    // Optional configs - 可选配置:
    
    self.interstitialView.delegate = self;
    
    // Other custimized setting:
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

#pragma mark - RYInterstitialViewDelegate

- (void)interstitialDidReceiveAd:(RYInterstitialView *)interstitial {
}

- (void)interstitialCountDownDidTap {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
