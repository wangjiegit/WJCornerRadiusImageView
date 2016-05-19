//
//  UIImage+WJRound.m
//  Test
//
//  Created by 王杰 on 16/3/21.
//  Copyright (c) 2016年 王. All rights reserved.
//

#import "UIImage+WJRound.h"

@implementation UIImage (WJRound)

+ (UIImage *)imageNamed:(NSString *)name size:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    UIImage *image = [UIImage imageNamed:name];
    return [self image:image size:size cornerRadius:cornerRadius];;
}

+ (UIImage *)image:(UIImage *)image size:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);//创建画板
    CGContextRef context = UIGraphicsGetCurrentContext();//获取画布
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(context, path.CGPath);//设置画布路径（显示的内容）
    CGContextClip(context);//截取路径
    [image drawInRect:rect];//将画板的内容画进image(image不会显示的)
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();//获取画布上的内容并赋值
    UIGraphicsEndImageContext();//关闭制图
    return newImage;
    
}

@end
