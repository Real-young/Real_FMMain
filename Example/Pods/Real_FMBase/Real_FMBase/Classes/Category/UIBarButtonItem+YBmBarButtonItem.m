//
//  UIBarButtonItem+YBmBarButtonItem.m
//  BuDeJie
//
//  Created by ybm on 16/4/26.
//  Copyright © 2016年 ybm. All rights reserved.
//

#import "UIBarButtonItem+YBmBarButtonItem.h"

@implementation UIBarButtonItem (YBmBarButtonItem)
+ (UIBarButtonItem *)item:(UIImage *)image highImage:(UIImage *)highImage target:( id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}
+ (UIBarButtonItem *)item:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}
@end
