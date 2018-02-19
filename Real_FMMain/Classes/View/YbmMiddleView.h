//
//  YbmMiddleView.h
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YbmMiddleView : UIView
+ (instancetype)shareInstance;

/**
 快速创建中间视图
 
 @return 中间的视图
 */
+ (instancetype)middleView;

/**
 控制是否正在播放
 */
@property (nonatomic, assign) BOOL isPlaying;

/**
 中间图片
 */
@property (nonatomic, strong) UIImage *middleImg;

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);
@end
