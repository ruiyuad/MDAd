//
//  BuoyViewController.m
//  OCTestRuiYuMob
//
//  Created by DerekYuYi on 2019/7/18.
//  Copyright © 2019 RuiYu. All rights reserved.
//

/*
 Abstracts: Buoy ads demo.
 */

#import "BuoyViewController.h"

@import RuiYuAdMob;

@interface BuoyViewController ()

/// `RYBuoyView`'s ratio is 110 : 110(Width : Height).
/// 浮标式广告展示宽高比是 110 : 110
@property (weak, nonatomic) IBOutlet RYBuoyView *buoyView;

@end

@implementation BuoyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Required configs - 初始化 RYInterstitialHalfView 实例之后, 必要的配置有:
    
    // 1. Required step1: configs `AdsID`
    self.buoyView.adsID = @"800006";
    
    // 2. Required step2: load request
    [self.buoyView loadRequest];
    
    // Optional configs - 可选配置. 这里可以根据业务需要去实现代理方法, 详情代理方法请查阅发布文档.
    
    // self.buoyView.delegate = self;
    
    // Other customized setting
    self.buoyView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}


@end
