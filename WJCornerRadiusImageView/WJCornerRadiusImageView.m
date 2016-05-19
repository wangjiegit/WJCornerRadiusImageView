//
//  WJCornerRadiusImageView.m
//  WJCornerRadiusImageView
//
//  Created by 王杰 on 16/5/19.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "WJCornerRadiusImageView.h"

@implementation WJCornerRadiusImageView {
    CAShapeLayer *maskLayer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        maskLayer = [CAShapeLayer layer];
        maskLayer.fillColor = [UIColor whiteColor].CGColor;
        maskLayer.strokeColor = [UIColor whiteColor].CGColor;
        maskLayer.fillRule = kCAFillRuleEvenOdd;
        [self.layer addSublayer:maskLayer];
    }
    return self;
}

- (void)setMaskColor:(UIColor *)maskColor {
    maskLayer.fillColor = maskColor.CGColor;
    maskLayer.strokeColor = maskColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:self.bounds];
    [bezierPath appendPath:[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.radius]];
    maskLayer.path = bezierPath.CGPath;
}

@end
