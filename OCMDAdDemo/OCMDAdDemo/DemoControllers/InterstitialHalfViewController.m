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

@interface InterstitialHalfViewController ()<RYInterstitialHalfViewDelegate>

@property (weak, nonatomic) IBOutlet RYInterstitialHalfView *halfInterstitialView;

@end

@implementation InterstitialHalfViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"插屏广告示例";
    
    // Required configs - 初始化 RYInterstitialHalfView 实例之后, 必要的配置有:
    
    /// 插屏式广告位展示宽高值推荐为 255.0 * (255.0 + 55.0), 为保证底部 Close 按钮正常显示, 请保证高度始终大于宽度 55.0
    
    // setup halfInterstitialView
    self.halfInterstitialView.adsID = @"840001";
    self.halfInterstitialView.rootViewController = self;
    self.halfInterstitialView.delegate = self;
    [self.halfInterstitialView loadRequest];
    
    // Other customized setting
}


#pragma mark - RYInterstitialViewDelegate

- (void)interstitialHalfDidReceiveAd:(RYInterstitialHalfView *)interstitial {}

- (void)interstitialHalfDidFailToReceiveAd:(RYInterstitialHalfView *)interstitial error:(RYError *)error {
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

@end
