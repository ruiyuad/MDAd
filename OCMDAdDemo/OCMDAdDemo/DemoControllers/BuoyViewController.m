//
//  BuoyViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/7/18.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Buoy ads demo.
 */

#import "BuoyViewController.h"

@import MDAd;

@interface BuoyViewController ()<RYBuoyViewDelegate>


@property (weak, nonatomic) IBOutlet RYBuoyView *buoyView;

@end

@implementation BuoyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"浮标广告";
    // Required configs - 初始化 RYInterstitialHalfView 实例之后, 必要的配置有:
    
    /// `RYBuoyView`'s ratio is 110 : 110(Width : Height).
    /// 浮标式广告展示宽高比是 110 : 110
    
    self.buoyView.adsID = @"860001";
    self.buoyView.rootViewController = self;
    self.buoyView.delegate = self;
    [self.buoyView loadRequest];
}

#pragma mark - RYBuoyViewDelegate

- (void)buoyDidReceiveAd:(RYBuoyView *)buoyView {
    NSLog(@"buoy ad received successfully.");
}

- (void)buoyDidFailToReceiveAd:(RYBuoyView *)buoyView error:(RYError *)error {
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
