//
//  HomePage.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/10/29.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import "HomePage.h"
#import "Ad.h"

#import "BannerViewController.h"
#import "InfoFlowViewController.h"
#import "InterstitialViewController.h"
#import "InterstitialHalfViewController.h"
#import "BuoyViewController.h"
#import "RewardVideoViewController.h"
#import "CustomViewController.h"

@interface HomePage ()

@property (copy, nonatomic) NSArray *ads;

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ads = @[@{@"Banner 广告": @[[[Ad alloc] initWithID:@"820001" title:@"纯图类型"],
                                   [[Ad alloc] initWithID:@"820004" title:@"左图右文类型"]]},
                 @{@"信息流广告": @[[[Ad alloc] initWithID:@"850006" title:@"上文下图带底部阴影类型"],
                               [[Ad alloc] initWithID:@"850009" title:@"上图下文类型"],
                               [[Ad alloc] initWithID:@"850008" title:@"左图右文类型(1:1.3)"],
                               [[Ad alloc] initWithID:@"8500011" title:@"三图类型"]]},
                 @{@"全屏广告": @[[[Ad alloc] initWithID:@"810001" title:@"开屏广告类型"],
                                [[Ad alloc] initWithID:@"810002" title:@"开屏广告类型"]]},
                 @{@"插屏广告": @[[[Ad alloc] initWithID:@"840001" title:@"插屏广告类型"]]},
                 @{@"浮标广告": @[[[Ad alloc] initWithID:@"860001" title:@"浮标广告类型"]]},
                 @{@"视频广告": @[[[Ad alloc] initWithID:@"870001" title:@"视频广告类型"]]},
                 @{@"自定义广告": @[[[Ad alloc] initWithID:@"-" title:@"自定义广告类型"]]}];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Default_UITableViewCell"];
}

#pragma mark - TableView DataSources && Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.ads.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 38.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSArray *)[self.ads[section] allValues].firstObject count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Default_UITableViewCell" forIndexPath:indexPath];
    
    NSArray *ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
    if (indexPath.row < ads.count) {
        Ad *ad = (Ad *)ads[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", ad.title, ad.adsID];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 38.0)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, view.bounds.size.width - 16*2, view.bounds.size.height)];
    label.textColor = UIColor.grayColor;
    label.font = [UIFont systemFontOfSize:15];
    label.text = (NSString *)[self.ads[section] allKeys].firstObject;
    [view addSubview:label];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   
    switch (indexPath.section) {
        case 0: {
            BannerViewController *bannerVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"BannerViewController"];
            if ([bannerVC isKindOfClass:BannerViewController.class] && bannerVC) {
                NSArray * ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
                if (ads.count > indexPath.row) {
                    bannerVC.adsID = ((Ad *)ads[indexPath.row]).adsID;
                }
                [self.navigationController pushViewController:bannerVC animated:YES];
            }
        }
            break;
            
        case 1: {
            InfoFlowViewController *infoFlowVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"InfoFlowViewController"];
            if ([infoFlowVC isKindOfClass:InfoFlowViewController.class] && infoFlowVC) {
                NSArray * ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
                if (ads.count > indexPath.row) {
                    infoFlowVC.adsID = ((Ad *)ads[indexPath.row]).adsID;
                }
                [self.navigationController pushViewController:infoFlowVC animated:YES];
            }
        }
            break;
            
        case 2: {
            InterstitialViewController *interstitialVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"InterstitialViewController"];
            if ([interstitialVC isKindOfClass:InterstitialViewController.class] && interstitialVC) {
                NSArray * ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
                if (ads.count > indexPath.row) {
                    interstitialVC.adsID = ((Ad *)ads[indexPath.row]).adsID;
                }
                [self.navigationController pushViewController:interstitialVC animated:YES];
            }
        }
            break;
            
        case 3: {
            InterstitialHalfViewController *interstitialHalfVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"InterstitialHalfViewController"];
            if ([interstitialHalfVC isKindOfClass:InterstitialHalfViewController.class] && interstitialHalfVC) {
                [self.navigationController pushViewController:interstitialHalfVC animated:YES];
            }
        }
            break;
            
        case 4: {
            BuoyViewController *buoyVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"BuoyViewController"];
            if ([buoyVC isKindOfClass:BuoyViewController.class] && buoyVC) {
                [self.navigationController pushViewController:buoyVC animated:YES];
            }
        }
            break;
            
        case 5: {
            RewardVideoViewController *rewardVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"RewardVideoViewController"];
            if ([rewardVC isKindOfClass:RewardVideoViewController.class] && rewardVC) {
                [self.navigationController pushViewController:rewardVC animated:YES];
            }
        }
            break;
            
        case 6: {
            CustomViewController *customVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"CustomViewController"];
            if ([customVC isKindOfClass:CustomViewController.class] && customVC) {
                [self.navigationController pushViewController:customVC animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
