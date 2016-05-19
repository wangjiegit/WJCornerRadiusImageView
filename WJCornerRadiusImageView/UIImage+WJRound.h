//
//  UIImage+WJRound.h
//  Test
//
//  Created by 王杰 on 16/3/21.
//  Copyright (c) 2016年 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WJRound)

+ (UIImage *)image:(UIImage *)image size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageNamed:(NSString *)name size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

@end
