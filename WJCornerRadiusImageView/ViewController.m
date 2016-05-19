//
//  ViewController.m
//  WJCornerRadiusImageView
//
//  Created by 王杰 on 16/5/19.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "WJCornerRadiusImageView.h"
#import "UIImageView+WebCache_WJ.h"
#import "UIImage+WJRound.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController {
    NSArray *titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    titleArr = @[@"UIImageView",@"WJCornerRadiusImageView",@"图片裁剪"];
    if (self.cornerMode != ImageViewCornerModelDefault) {
        self.title = titleArr[self.cornerMode -1];
    } else {
        self.title = @"圆角性能";
    }
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = self.view.bounds;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.cornerMode == ImageViewCornerModelDefault) return titleArr.count;
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cornerMode == ImageViewCornerModelDefault) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageViewCornerModelDefault"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ImageViewCornerModelDefault"];
        }
        cell.textLabel.text = titleArr[indexPath.row];
        return cell;
        
    } else if (self.cornerMode == ImageViewCornerModelNormal) {
        //没处理过的UIImageView
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageViewCornerModelNormal"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ImageViewCornerModelNormal"];
            CGFloat left = 0;
            for (int i = 0; i < 8; i++) {
                UIImageView *imgView = [[UIImageView alloc] init];
                imgView.tag = 100 + i;
                imgView.frame = CGRectMake(left, 0, 44, 44);
                imgView.layer.cornerRadius = 22;
                imgView.layer.masksToBounds = YES;
                [cell.contentView addSubview:imgView];
                left += 45;
            }
        }
        for (int i = 0; i < 8; i++) {
            UIImageView *imgView = [cell.contentView viewWithTag:100 + i];
            [imgView wj_setImageWithURLString:@"https://img3.doubanio.com/view/photo/photo/public/p2173915266.jpg"];
        }
        return cell;
        
        
        
    } else if (self.cornerMode == ImageViewCornerModelMaskLayer) {
        //通过添加一层calayer，形成圆角
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageViewCornerModelMaskLayer"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ImageViewCornerModelMaskLayer"];
            CGFloat left = 0;
            for (int i = 0; i < 8; i++) {
                WJCornerRadiusImageView *imgView = [[WJCornerRadiusImageView alloc] init];
                imgView.tag = 100 + i;
                imgView.frame = CGRectMake(left, 0, 44, 44);
                imgView.radius = 22;
                imgView.maskColor = [UIColor whiteColor];
                [cell.contentView addSubview:imgView];
                left += 45;
            }
        }
        for (int i = 0; i < 8; i++) {
            UIImageView *imgView = [cell.contentView viewWithTag:100 + i];
            [imgView wj_setImageWithURLString:@"https://img3.doubanio.com/view/photo/photo/public/p2173915266.jpg"];
        }
        return cell;
        
        
    } else if (self.cornerMode == ImageViewCornerModelShear) {
        //通过裁剪图片，形成圆角
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageViewCornerModelShear"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ImageViewCornerModelShear"];
            CGFloat left = 0;
            for (int i = 0; i < 8; i++) {
                UIImageView *imgView = [[UIImageView alloc] init];
                imgView.tag = 100 + i;
                imgView.contentMode = UIViewContentModeScaleAspectFill;
                imgView.frame = CGRectMake(left, 0, 44, 44);
                [cell.contentView addSubview:imgView];
                left += 45;
            }
        }
        
        for (int i = 0; i < 8; i++) {
            UIImageView *imgView = [cell.contentView viewWithTag:100 + i];
            [imgView sd_setImageWithURL:[NSURL URLWithString:@"https://img3.doubanio.com/view/photo/photo/public/p2173915266.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                imgView.image = [UIImage image:image size:CGSizeMake(44, 44) cornerRadius:22];
            }];
        }
        
        return cell;
        
    }
    
    return [[UITableViewCell alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cornerMode != ImageViewCornerModelDefault) return;
    ViewController *vc = [[ViewController alloc] init];
    vc.cornerMode = indexPath.row + 1;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
