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

@property (strong, nonatomic) RYRewardVideoViewController *rewardVideoVC;

/// 默认第一次进入页面预加载视频.
/// 如果后续需要在当前页面多次加载视频, 请在第一次预加载成功后, 设置为 NO.
@property (assign, nonatomic) BOOL isPreLoadRewardVideo;

@end

@implementation RewardVideoViewController

- (void)dealloc {
    self.rewardVideoVC.delegate = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isPreLoadRewardVideo = YES;
    
    self.rewardVideoVC = [[RYRewardVideoViewController alloc] init];
    self.rewardVideoVC.adsID = @"870001";
    self.rewardVideoVC.needDisplayBackgroundImageView = true;
    self.rewardVideoVC.delegate = self;
    [self.rewardVideoVC loadRequest];
}


- (IBAction)openRewardVideo:(UIButton *)sender {
    
    if (!self.isPreLoadRewardVideo) {
        [self.rewardVideoVC loadRequest];
    }
    
    self.rewardVideoVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:self.rewardVideoVC animated:true completion:nil];
    self.isPreLoadRewardVideo = NO;
    
    /*
     第二种加载方式:
     在每个场景直接创建局部 `RYRewardVideoViewController`的实例, 每个实例管理一次完整的视频加载生命周期.
     
    RYRewardVideoViewController *rewardVideoVC = [[RYRewardVideoViewController alloc] init];
    rewardVideoVC.adsID = @"870001";
    rewardVideoVC.needDisplayBackgroundImageView = true;
    rewardVideoVC.delegate = self;
    [rewardVideoVC loadRequest];
    [self presentViewController:rewardVideoVC animated:true completion:nil];
    */
}


#pragma mark - RYRewardVideoViewControllerDelegate

- (void)rewardVideoDidReceiveAd:(RYRewardVideoViewController *)controller {
    NSLog(@"reward video received successfully");
}

- (void)rewardVideoDidFailToReceiveAd:(RYRewardVideoViewController *)controller error:(RYError *)error {
    
    NSLog(@"Reward video received failed and the error info is %@", error.errorDescription);
}

- (void)rewardVideoIsReadyForPlay:(RYRewardVideoViewController *)controller isReadyForPlay:(BOOL)isReady {
    NSLog(@"rewardVideoIsReadyForPlay");
}

- (void)rewardVideoWillClose {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
