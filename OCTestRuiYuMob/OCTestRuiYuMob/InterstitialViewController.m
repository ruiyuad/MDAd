//
//  InterstitialViewController.m
//  OCTestRuiYuMob
//
//  Created by DerekYuYi on 2019/7/16.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Interstitial ads demo.
 */

#import "InterstitialViewController.h"

@import RuiYuAdMob;

@interface InterstitialViewController ()<RYInterstitialViewDelegate>

/// `RYInfoFlowView`'s ratio is 750 : 1334(Width : Height).
/// 插页式广告展示宽高比是 750 : 1334
@property (weak, nonatomic) IBOutlet RYInterstitialView *interstitialView;

@property (weak, nonatomic) IBOutlet UIButton *skipButton;

@end

@implementation InterstitialViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInterstitialView 实例之后, 必要的配置有:
    
    // 1. Required step1: configs `AdsID`
    self.interstitialView.adsID = @"800001";
    
    // 2. Required step2: load request
    [self.interstitialView loadRequest];
    
    // Optional configs - 可选配置:
    
    self.interstitialView.delegate = self;
    
    // Other custimized setting:
    
    [self.skipButton setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (IBAction)skipButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - RYInterstitialViewDelegate

- (void)interstitialDidReceiveAd:(RYInterstitialView *)interstitial {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.skipButton setHidden:NO];
    });
}


@end
