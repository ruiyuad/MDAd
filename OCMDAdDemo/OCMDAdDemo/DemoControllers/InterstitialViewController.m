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


@property (weak, nonatomic) IBOutlet RYInterstitialView *interstitialView;

@end

@implementation InterstitialViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全屏广告示例";
    
    // Required configs - 初始化 RYInterstitialView 实例之后, 必要的配置有:
    
    switch (self.adsID.integerValue) {
        
        // 纯图模式, adsID 为 810001
        // 广告位尺寸是 750.0 : 1334.0
        case 810001: {
            self.interstitialView.adsID = @"810001";
            self.interstitialView.rootViewController = self;
            self.interstitialView.delegate = self;
            [self.interstitialView loadRequest];
        }
            break;
        
        // 左图右文模式, adsID 为 810002
        // 广告位尺寸是 750.0 : 1143.0
        case 810002: {
            self.interstitialView.adsID = @"810002";
            self.interstitialView.rootViewController = self;
            self.interstitialView.delegate = self;
            [self.interstitialView loadRequest];
            
            /// Only works for interstitial ad which adsID is 810002.
            /*
            [self.interstitialView configWithAppLogo:[UIImage imageNamed:@"appIcon40"] appName:@"妙招助手, 活出每一个细节"];
            self.interstitialView.logoTextColor = UIColor.darkTextColor;
            self.interstitialView.logoTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:18.0];
            self.interstitialView.logoCornerRadius = 5.0;
            */
        }
            break;
            
        default:
            break;
    }
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

- (void)interstitialDidReceiveAd:(RYInterstitialView *)interstitial {}

- (void)interstitialDidFailToReceiveAd:(RYInterstitialView *)interstitial error:(RYError *)error {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"检测返回异常"
                                                                     message: error.errorDescription
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)interstitialCountDownDidTap {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
