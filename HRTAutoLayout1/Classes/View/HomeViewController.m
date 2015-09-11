//
//  HomeViewController.m
//  HRTAutoLayout1
//
//  Created by Hirat on 15/9/11.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry.h>

@interface HomeViewController ()
@property (nonatomic, strong) UIView* leftView;
@property (nonatomic, strong) UIView* rightView;
@end

@implementation HomeViewController

- (void)loadView
{
    [super loadView];
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"AutoLayout1";
    
    self.leftView = [[UIView alloc] init];
    self.leftView.backgroundColor = [UIColor redColor];
    [self.view addSubview: self.leftView];
    
    CGFloat padding = 15; // 间距
    CGFloat ratio = 1.5; // 长宽比
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padding);
        make.leading.mas_equalTo(padding);
        make.height.equalTo(self.leftView.mas_width).multipliedBy(ratio);
    }];
    
    self.rightView = [[UIView alloc] init];
    self.rightView.backgroundColor = [UIColor greenColor];
    [self.view addSubview: self.rightView];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padding);
        make.leading.equalTo(self.leftView.mas_trailing).with.offset(padding);
        make.trailing.mas_equalTo(-padding);
        make.width.equalTo(self.leftView.mas_width).multipliedBy(2);
        make.height.equalTo(self.leftView.mas_height);
    }];
    
}


@end
