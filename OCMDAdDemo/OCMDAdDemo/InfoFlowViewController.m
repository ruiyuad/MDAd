//
//  InfoFlowViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/7/16.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Infomation flow ads demo.
 */

#import "InfoFlowViewController.h"

@import MDAd;

@interface InfoFlowViewController ()<RYInfoFlowViewDelegate>

/// `RYInfoFlowView`'s ratio is 700 : 280 (Width : Height).
///  信息流广告展示宽高比是 700 : 280
@property (weak, nonatomic) IBOutlet RYInfoFlowView *infoFlowView;

@end

@implementation InfoFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInfoFlowView 实例之后, 必要的配置有:
    
    // 1. Required step1: configs `AdsID`
    self.infoFlowView.adsID = @"800005";
    
    // 2. Required step2: load request
    [self.infoFlowView loadRequest];
    
    // Optional configs - 可选配置:
    
    self.infoFlowView.delegate = self;
    self.infoFlowView.alpha = 0.0;
}

#pragma mark - RYInfoFlowViewDelegate

- (void)infoFlowViewDidReceiveAd:(RYInfoFlowView *)infoFlowView {
    // You can show infoFlowView with animation.
    // 你可以在收到信息流广告后, 在这里使用动画来展示它.
    [UIView animateWithDuration:1.0 animations:^{
        self.infoFlowView.alpha = 1.0;
    }];
}


@end
