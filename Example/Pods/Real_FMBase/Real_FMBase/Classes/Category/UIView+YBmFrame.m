//
//  UIView+YBmFrame.m
//  BuDeJie
//
//  Created by ybm on 16/4/25.
//  Copyright © 2016年 ybm. All rights reserved.
//

#import "UIView+YBmFrame.h"

@implementation UIView (YBmFrame)
- (CGFloat)YBm_x
{
    return self.frame.origin.x;
}
- (void)setYBm_x:(CGFloat)YBm_x
{
    CGRect frame = self.frame;
    frame.origin.x = YBm_x;
    self.frame = frame;
}

- (CGFloat)YBm_y
{
    return self.frame.origin.y;
}
- (void)setYBm_y:(CGFloat)YBm_y
{
    CGRect frame = self.frame;
    frame.origin.y = YBm_y;
    self.frame = frame;
}

- (CGFloat)YBm_width
{
    return self.frame.size.width;
}
- (void)setYBm_width:(CGFloat)YBm_width
{
    CGRect frame = self.frame;
    frame.size.width = YBm_width;
    self.frame = frame;
}

- (CGFloat)YBm_height
{
    return self.frame.size.height;
}
- (void)setYBm_height:(CGFloat)YBm_height
{
    CGRect frame = self.frame;
    frame.size.height = YBm_height;
    self.frame = frame;
}

- (CGFloat)YBm_centerX
{
    return self.center.x;
}
- (void)setYBm_centerX:(CGFloat)YBm_centerX
{
    CGPoint center = self.center;
    center.x = YBm_centerX;
    self.center = center;
}

- (CGFloat)YBm_centerY
{
    return self.center.y;
}
- (void)setYBm_centerY:(CGFloat)YBm_centerY
{
    CGPoint center = self.center;
    center.y = YBm_centerY;
    self.center = center;
}
@end
