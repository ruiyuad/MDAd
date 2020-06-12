//
//  CustomViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/10/29.
//  Copyright © 2019 RuiYu. All rights reserved.
//


/**
Abstract: 演示自定义广告类 `RYCustomAd` 的使用.
*/


#import "CustomViewController.h"
#import "CustomAdView.h"
@import MDAd;

@interface CustomViewController ()<RYCustomAdDelegate, CustomAdViewDelegate>

/// 你可以选择不同的广告类型进行自定义, 比如 Banner 广告, 信息流广告, 全屏广告等
/// 详情请看 `BannerViewController`, `InfoFlowViewController`, `InterstitialViewController` 等.
/// 这里选择信息流广告类型(850008) 来进行自定义展示.
@property (nonatomic, strong) RYCustomAd *customAd;

@property (nonatomic, strong) CustomAdView *customView;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义广告";
    
    // setup your custom view
    [self setupCustomView];
    
    // setup customAd instance
    self.customAd = [[RYCustomAd alloc] initWithAdsID:@"850008"];
    self.customAd.rootViewController = self;
    self.customAd.delegate = self;
    [self.customAd loadRequest];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.customView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 100);
}

- (void)setupCustomView {
    
    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"CustomAdView" owner:self options:nil];
    if (nibArray.firstObject && [nibArray.firstObject isKindOfClass:CustomAdView.class]) {
        self.customView = nibArray.firstObject;
        [self.view addSubview:self.customView];
        self.customView.delegate = self;
    }
}


#pragma mark - RYCustomAdDelegate

- (void)customAdDidReceiveAd:(RYCustomAd *)customAd receivedData:(RYCustomAdItem *)item {
    
    /** `140.0/180.0` 是自定义广告对应的广告图片的比例. 因为这里选择的广告是 850008, 其广告图片对应的比例是 `140.0/180.0`.
        注意: 在进行自定义广告时, 请务必保证自定义图片的比例与对应广告类型图片比例保持一致. 对应广告类型图片比例请查看对应产品文档.
    */
    [self.customView updateWithImageUrlString:item.imageUrls.firstObject
                                        title:item.title
                                         desc:item.desc
                                   imageRatio:140.0/180.0];
}

- (void)customAdDidFailToReceiveAd:(RYCustomAd *)customAd error:(RYError *)error {
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


#pragma mark - CustomAdViewDelegate

- (void)adTapped {
    // open ad link.
    // called when you add gestures, actions or other Selectors to you custom ad view.
    [self.customAd openAdLink];
}

@end
