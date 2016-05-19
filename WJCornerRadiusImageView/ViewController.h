//
//  ViewController.h
//  WJCornerRadiusImageView
//
//  Created by 王杰 on 16/5/19.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImageViewCornerModel) {
    ImageViewCornerModelDefault = 0,
    ImageViewCornerModelNormal = 1,
    ImageViewCornerModelMaskLayer = 2,
    ImageViewCornerModelShear = 3,
};

@interface ViewController : UIViewController

@property(nonatomic) ImageViewCornerModel cornerMode;

@end

