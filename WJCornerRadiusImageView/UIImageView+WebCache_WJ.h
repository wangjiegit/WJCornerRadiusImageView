//
//  UIImageView+WebCache_WJ.h
//  gegejia
//
//  Created by 王杰 on 16/3/16.
//  Copyright (c) 2016年 Neo Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebCache_WJ)

- (void)wj_setImageWithURLString:(NSString *)URLString;

- (void)wj_setImageWithURLString:(NSString *)URLString placeholderImageName:(NSString *)imageName;

@end