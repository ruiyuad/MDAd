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
#import "CustomViewController.h"

@interface HomePage ()

@property (copy, nonatomic) NSArray *ads;

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ads = @[
        @{@"开屏广告": @[
                  [[Ad alloc] initWithID:@"810001" title:@"开屏-单图0.56"],
                  [[Ad alloc] initWithID:@"810002" title:@"开屏-上图下logo0.7"]]},
        @{@"Banner广告": @[
                  [[Ad alloc] initWithID:@"820001" title:@"Banner-单图10.67"],
                  [[Ad alloc] initWithID:@"820004" title:@"Banner-左图右文1.56"],
                  [[Ad alloc] initWithID:@"820005" title:@"Banner-单图4.26"]]},
        @{@"插屏广告": @[[[Ad alloc] initWithID:@"840001" title:@"插屏广告"]]},
        @{@"信息流广告": @[
                  [[Ad alloc] initWithID:@"850002" title:@"信息流-左图右文0.67"],
                  [[Ad alloc] initWithID:@"850006" title:@"信息流-上文下图1.78"],
                  [[Ad alloc] initWithID:@"850007" title:@"信息流-左文右图0.78"],
                  [[Ad alloc] initWithID:@"850008" title:@"信息流-左图右文0.78"],
                  [[Ad alloc] initWithID:@"850009" title:@"信息流-上图下文1.78"],
                  [[Ad alloc] initWithID:@"850010" title:@"信息流-左图右文1.5"],
                  [[Ad alloc] initWithID:@"850011" title:@"信息流-左文右图1.5"]]},
        @{@"浮标广告": @[[[Ad alloc] initWithID:@"860001" title:@"浮标广告"]]},
        @{@"自定义广告": @[[[Ad alloc] initWithID:@"-" title:@"自定义广告"]]}];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Default_UITableViewCell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
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
            InterstitialViewController *interstitialVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"InterstitialViewController"];
            if ([interstitialVC isKindOfClass:InterstitialViewController.class] && interstitialVC) {
                NSArray * ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
                if (ads.count > indexPath.row) {
                    interstitialVC.adModel = ((Ad *)ads[indexPath.row]);
                }
                [self.navigationController pushViewController:interstitialVC animated:YES];
            }
        }
            break;
            
        case 1: {
            BannerViewController *bannerVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"BannerViewController"];
            if ([bannerVC isKindOfClass:BannerViewController.class] && bannerVC) {
                NSArray * ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
                if (ads.count > indexPath.row) {
                    bannerVC.adModel = ((Ad *)ads[indexPath.row]);
                }
                [self.navigationController pushViewController:bannerVC animated:YES];
            }
        }
            break;
            
        case 2: {
            InterstitialHalfViewController *interstitialHalfVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"InterstitialHalfViewController"];
            if ([interstitialHalfVC isKindOfClass:InterstitialHalfViewController.class] && interstitialHalfVC) {
                [self.navigationController pushViewController:interstitialHalfVC animated:YES];
            }
        }
            break;
            
        case 3: {
            InfoFlowViewController *infoFlowVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"InfoFlowViewController"];
            if ([infoFlowVC isKindOfClass:InfoFlowViewController.class] && infoFlowVC) {
                NSArray * ads = (NSArray *)[self.ads[indexPath.section] allValues].firstObject;
                if (ads.count > indexPath.row) {
                    infoFlowVC.adModel = ((Ad *)ads[indexPath.row]);
                }
                [self.navigationController pushViewController:infoFlowVC animated:YES];
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
