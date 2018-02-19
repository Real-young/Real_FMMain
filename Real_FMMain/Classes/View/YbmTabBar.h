//
//  YbmTabBar.h
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YbmTabBar : UITabBar
/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);
@end
