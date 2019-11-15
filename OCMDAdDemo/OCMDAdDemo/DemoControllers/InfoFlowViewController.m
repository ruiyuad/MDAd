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

@property (weak, nonatomic) IBOutlet RYInfoFlowView *infoFlowView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoFlowViewHeightConstraint;
@property CGFloat ratio;
@property CGFloat extraHeight;

@end

@implementation InfoFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"信息流广告示例";

    // Required configs - 初始化 RYInfoFlowView 实例之后, 必要的配置有:
    
    // 信息流广告位可选择6种样式. 不同的 AdsID 对应不同样式. 以下分别列举6种信息流广告位的 adsID 和 尺寸.
    
    switch (self.adsID.integerValue) {
        case 850001: {
            // 纯图模式, adsID 为 850001, 广告位尺寸是 700.0 : 280.0 (请初始化 infoFlowView 初始宽高比为 700.0 : 280.0)
            self.ratio = 700.0 / 280.0;
            
            self.infoFlowView.adsID = @"850001";
            self.infoFlowView.rootViewController = self;
            self.infoFlowView.delegate = self;
            [self.infoFlowView loadRequest];
        }
            break;
            
        case 850002: {
            // 左图右文模式, adsID 为 850002, 广告位尺寸是 690.0 : 290.0, 广告图片比例是 576: 386(请初始化 infoFlowView 初始宽高比为 690.0 : 290.0)
            self.ratio = 690.0 / 290.0;
            
            self.infoFlowView.adsID = @"850002";
            self.infoFlowView.rootViewController = self;
            self.infoFlowView.delegate = self;
            [self.infoFlowView loadRequest];
        }
            
        case 850006: {
            // 上文下图底部浮层模式, adsID 为 850006, 广告位尺寸是 690.0 : 440.0
            self.ratio = 686.0 / 386.0;
            
            self.infoFlowView.adsID = @"850006";
            // 配置 isShowDescriptionText 为 YES, 打开浮层模式, 否则关闭. 默认关闭
            self.infoFlowView.isShowDescriptionText = YES;
            self.infoFlowView.rootViewController = self;
            self.infoFlowView.delegate = self;
            [self.infoFlowView loadRequest];
            
            self.extraHeight = 26;
        }
        
        case 850008: {
            // 左图右文模式, adsID 为 850008, 广告位尺寸是 690.0 : 290.0, 广告图片比例是 140: 180 (请初始化 infoFlowView 初始宽高比为 690.0 : 290.0)
            self.ratio = 700.0 / 280.0;
            
            self.infoFlowView.adsID = @"850008";
            self.infoFlowView.rootViewController = self;
            self.infoFlowView.delegate = self;
            [self.infoFlowView loadRequest];
        }
            
        case 850009: {
            // 上图下文模式, adsID 为 850009, 广告位尺寸是 690.0 : 440.0
            self.ratio = 686.0 / 386.0;
            
            self.infoFlowView.adsID = @"850009";
            self.infoFlowView.rootViewController = self;
            self.infoFlowView.delegate = self;
            [self.infoFlowView loadRequest];
            
            self.extraHeight = 26;
        }
            
        default:
            break;
    }
    
    //
    
    // Other custimized settings
    
    self.infoFlowView.isShowCloseButton = NO;
    self.infoFlowView.isShowDownloadButton = NO;
    self.infoFlowView.alpha = 0.0;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (!self.infoFlowView) { return; }
    self.infoFlowViewHeightConstraint.constant = self.infoFlowView.bounds.size.width / self.ratio + self.extraHeight;
    [self.infoFlowView updateConstraintsIfNeeded];
}


#pragma mark - RYInfoFlowViewDelegate

- (void)infoFlowDidReceiveAd:(RYInfoFlowView *)infoFlowView {
    // You can show infoFlowView with animation.
    // 你可以在收到信息流广告后, 在这里使用动画来展示它.
    [UIView animateWithDuration:1.0 animations:^{
        self.infoFlowView.alpha = 1.0;
    }];
}

- (void)infoFlowDidFailToReceiveAd:(RYInfoFlowView *)infoFlowView error:(RYError *)error {
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
