//
//  MainViewController.m
//  OCMDAdDemo
//
//  Created by ruiyu on 2019/9/30.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import "MainViewController.h"
@import MDAd;

@interface MainViewController () <RYInterstitialViewDelegate>
 
@property (nonatomic, strong) RYInterstitialView *interstitialView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    _interstitialView = [RYInterstitialView new];
    [self.view addSubview:_interstitialView];
    _interstitialView.frame = self.view.frame;
    _interstitialView.delegate = self;
    _interstitialView.adsID = @"810001";
    [_interstitialView loadRequest];
    
}


#pragma mark - RYInterstitialViewDelegate
/// Called when an interstitial ad request succeeded.
- (void)interstitialDidReceiveAd:(RYInterstitialView * _Nonnull)interstitial{
    
}
/// Called when an interstitial ad request completed without an interstitial to show.
- (void)interstitialDidFailToReceiveAd:(RYInterstitialView * _Nonnull)interstitial error:(RYError * _Nonnull)error{
//    [UIApplication sharedApplication].keyWindow.rootViewController = [RYTabBarController new];
}
/// Tells the delegate that the user click will open another app, backgrounding the current application.
- (void)interstitialWillLeaveApplication:(RYInterstitialView * _Nonnull)interstitial{
    
}
/// Tell the delegate that the user did clicked the close button.
- (void)interstitialCountDownDidTap{
//    [UIApplication sharedApplication].keyWindow.rootViewController = [RYTabBarController new];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
