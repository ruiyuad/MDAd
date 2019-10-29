//
//  Ad.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/10/29.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import "Ad.h"

@implementation Ad

- (Ad *)initWithID:(NSString *)adsID title:(NSString *)title {
    self = [super init];
    if (self) {
        self.adsID = adsID;
        self.title = title;
    }
    return self;
}

@end
