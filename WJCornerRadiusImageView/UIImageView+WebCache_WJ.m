//
//  UIImageView+WebCache_WJ.m
//  gegejia
//
//  Created by 王杰 on 16/3/16.
//  Copyright (c) 2016年 Neo Yang. All rights reserved.
//

#import "UIImageView+WebCache_WJ.h"
#import "UIImageView+WebCache.h"

static const CGFloat SDWebImageFadeAnimationDuration = 0.2;

@implementation UIImageView (WebCache_WJ)

- (void)wj_setImageWithURLString:(NSString *)URLString {
    [self wj_setImageWithURLString:URLString placeholderImageName:@"home_default_goods"];
}

- (void)wj_setImageWithURLString:(NSString *)URLString placeholderImageName:(NSString *)imageName {
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.clipsToBounds = YES;
    [self sd_setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:[UIImage imageNamed:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!image) return;
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = UIViewContentModeScaleAspectFill;
        if (cacheType == SDImageCacheTypeNone) {
            CATransition *animation = [CATransition animation];
            animation.type = kCATransitionFade;
            animation.duration = SDWebImageFadeAnimationDuration;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [self.layer addAnimation:animation forKey:nil];
        }
    }];
}

@end
