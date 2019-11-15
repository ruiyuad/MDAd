//
//  CustomAdView.m
//  OCMDAdDemo
//
//  Created by DerekYuYi on 2019/11/14.
//  Copyright © 2019 RuiYu. All rights reserved.
//

#import "CustomAdView.h"

@implementation CustomAdView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(customAdTapped:)];
    [self setUserInteractionEnabled:true];
    [self addGestureRecognizer:tapGesture];
    
    self.mainImageView.layer.masksToBounds = true;
    self.mainImageView.layer.cornerRadius = 3.0;
}

- (void)updateWithImageUrlString:(NSString *)imageUrlString
                           title:(NSString *)titleString
                            desc:(NSString *)descString
                      imageRatio:(CGFloat)ratio {
    self.mainImageViewRatioConstraint.constant = ratio;
    
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageUrlString];
    if ([imageUrl isKindOfClass:NSURL.class] && imageUrl) {
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.mainImageView.image = [[UIImage alloc] initWithData:imageData];
        });
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.mainTitleLabel.text = titleString;
        self.mainDetailsLabel.text = descString;
    });
}

- (void)customAdTapped:(UITapGestureRecognizer *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(adTapped)]) {
        [self.delegate adTapped];
    }
}


@end
