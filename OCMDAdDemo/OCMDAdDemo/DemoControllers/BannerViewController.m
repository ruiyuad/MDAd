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

// 这里为了便于展示, RYBannerView 的实例均采用 Interface Builder 来快速构建视图. 开发者可自行选择初始化方式.
@property (weak, nonatomic) IBOutlet RYBannerView *bannerView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerViewHeightConstraint;
@property CGFloat ratio;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"横幅广告示例";
    
    // 横幅广告位可选择两种样式. 不同的 AdsID 对应不同样式. 以下分别列举2种横幅广告位的 adsID 和 尺寸. 每次请选择一种样式展示.
    
    switch (self.adsID.integerValue) {
        
        // 纯图模式, adsID 为 820001, 广告位尺寸是 640.0 : 60.0 (请初始化 bannerView 初始宽高比为 640.0 : 60.0)
        case 820001: {
            self.bannerView.adsID = self.adsID;
            self.bannerView.rootViewController = self;
            self.bannerView.delegate = self;
            [self.bannerView loadRequest];
            self.ratio = 640.0 / 60.0;
        }
            break;
        
        // 左图右文模式, adsID 为 820004, 广告位尺寸是 690.0 : 100.0 (请初始化 bannerView 初始宽高比为 690.0 : 100.0)
        case 820004: {
            self.bannerView.adsID = self.adsID;
            self.bannerView.rootViewController = self;
            self.bannerView.delegate = self;
            [self.bannerView loadRequest];
            self.ratio = 690.0 / 100.0;
        }
            break;
            
        default:
            break;
    }
    
    // Other customized settings
    self.bannerView.alpha = 0.2;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (!self.bannerView) { return; }
    self.bannerViewHeightConstraint.constant = self.bannerView.bounds.size.width / self.ratio;
    [self.bannerView updateConstraintsIfNeeded];
}


#pragma mark - RYBannerViewDelegate

- (void)bannerDidReceiveAd:(RYBannerView *)bannerView {
    [UIView animateWithDuration:1.0 animations:^{
        self.bannerView.alpha = 1.0;
    }];
}

- (void)bannerDidFailToReceiveAd:(RYBannerView *)bannerView error:(RYError *)error {
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
