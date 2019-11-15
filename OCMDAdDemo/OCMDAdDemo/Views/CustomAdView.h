//
//  CustomAdView.h
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/11/14.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAdViewDelegate <NSObject>

@optional
- (void)adTapped;

@end


NS_ASSUME_NONNULL_BEGIN

@interface CustomAdView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainDetailsLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainImageViewRatioConstraint;

@property (weak, nonatomic) id<CustomAdViewDelegate> delegate;

- (void)updateWithImageUrlString:(NSString *)imageUrlString
                           title:(NSString *)titleString
                            desc:(NSString *)descString
                      imageRatio:(CGFloat)ratio;

@end

NS_ASSUME_NONNULL_END
