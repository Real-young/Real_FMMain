//
//  CALayer+YbmPauseAimate.h
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (YbmPauseAimate)
/**
 暂停动画
 */
- (void)pauseAnimate;
/**
 恢复动画
 */
- (void)resumeAnimate;
@end
