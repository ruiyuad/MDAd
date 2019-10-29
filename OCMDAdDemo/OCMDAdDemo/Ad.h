//
//  Ad.h
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/10/29.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ad : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *adsID;

- (Ad *)initWithID:(NSString *)adsID title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
