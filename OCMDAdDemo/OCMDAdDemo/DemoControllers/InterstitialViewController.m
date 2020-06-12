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
    self.title = self.adModel.adsID;
    
    // Required configs - 初始化 RYInterstitialView 实例之后, 必要的配置有:
    
    switch (self.adModel.adsID.integerValue) {
        
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
        // 广告位尺寸是 750.0 : 1334.0，底部logo界面高度为屏幕宽度的1/3
        case 810002: {
            self.interstitialView.adsID = @"810002";
            self.interstitialView.rootViewController = self;
            self.interstitialView.delegate = self;
            [self.interstitialView loadRequest];
            
            /// Only works for interstitial ad which adsID is 810002.
            self.interstitialView.bottomLogoView = [self bottomLogoView];
        }
            break;
            
        default:
            break;
    }
}

- (UIView *)bottomLogoView {
    CGFloat logoViewHeight = [UIScreen mainScreen].bounds.size.width / 3.0;
    CGFloat logoImageViewHeight = 40.0;
    CGFloat logoLabelHeight = 20.0;
    CGFloat gapBetweenLogoLabelAndLogoImageView = 4.0;
    CGFloat verticalGap = (logoViewHeight - logoImageViewHeight - logoLabelHeight - gapBetweenLogoLabelAndLogoImageView) / 2.0;
    
    UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - logoViewHeight, [UIScreen mainScreen].bounds.size.width,  logoViewHeight)];
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0 - (logoImageViewHeight / 2.0), verticalGap, logoImageViewHeight, logoImageViewHeight)];
    logoImageView.image = [UIImage imageNamed:@"appIcon40"];
    logoImageView.layer.cornerRadius = 5.0;
    
    UILabel *logoTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(logoImageView.frame), [UIScreen mainScreen].bounds.size.width, logoLabelHeight)];
    logoTextLabel.textAlignment = NSTextAlignmentCenter;
    logoTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:20];
    logoTextLabel.textColor = [[UIColor darkTextColor] colorWithAlphaComponent:0.6];
    logoTextLabel.text = @"MDAd，广告展示更优雅";
    
    [logoView addSubview:logoImageView];
    [logoView addSubview:logoTextLabel];
    
    return logoView;
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
