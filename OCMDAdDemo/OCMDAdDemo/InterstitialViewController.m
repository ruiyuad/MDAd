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
    self.title = @"开屏广告示例";
    
    // Required configs - 初始化 RYInterstitialView 实例之后, 必要的配置有:
    
    /// `RYInfoFlowView`'s ratio is 750 : 1334(Width : Height).
    /// 插页式广告展示宽高比是 750 : 1334
    
    self.interstitialView.adsID = @"810001";
    self.interstitialView.rootViewController = self;
    self.interstitialView.delegate = self;
    [self.interstitialView loadRequest];
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
