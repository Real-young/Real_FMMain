//
//  CALayer+YbmPauseAimate.m
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import "CALayer+YbmPauseAimate.h"

@implementation CALayer (YbmPauseAimate)
- (void)pauseAnimate {
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() toLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

- (void)resumeAnimate {
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() toLayer:nil] - pausedTime;
    self.beginTime = timeSincePause;
}
@end
