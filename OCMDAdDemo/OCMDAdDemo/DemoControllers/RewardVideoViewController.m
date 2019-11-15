//
//  RewardVideoViewController.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/11/14.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import "RewardVideoViewController.h"
@import MDAd;

@interface RewardVideoViewController ()<RYRewardVideoViewControllerDelegate>

@end

@implementation RewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)openRewardVideo:(UIButton *)sender {
    /// 不要全局持有 `RYRewardVideoViewController`的实例, 每个实例管理一次完整的视频加载生命周期.
    RYRewardVideoViewController *rewardVideoVC = [[RYRewardVideoViewController alloc] init];
    rewardVideoVC.adsID = @"870001";
    rewardVideoVC.delegate = self;
    [rewardVideoVC loadRequest];
    [self presentViewController:rewardVideoVC animated:true completion:nil];
}


#pragma mark - RYRewardVideoViewControllerDelegate

- (void)rewardVideoDidReceiveAd:(RYRewardVideoViewController *)controller {
    NSLog(@"reward video received successfully");
}

- (void)rewardVideoDidFailToReceiveAd:(RYRewardVideoViewController *)controller error:(RYError *)error {
    
    NSLog(@"Reward video received failed and the error info is %@", error.errorDescription);
}

- (void)RewardVideoWillClose {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
