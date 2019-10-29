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

@interface BuoyViewController ()


@property (weak, nonatomic) IBOutlet RYBuoyView *buoyView;

@end

@implementation BuoyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInterstitialHalfView 实例之后, 必要的配置有:
    
    /// `RYBuoyView`'s ratio is 110 : 110(Width : Height).
    /// 浮标式广告展示宽高比是 110 : 110
    
    self.buoyView.adsID = @"860001";
    self.buoyView.rootViewController = self;
    [self.buoyView loadRequest];
    
    // self.buoyView.delegate = self;
}


@end
