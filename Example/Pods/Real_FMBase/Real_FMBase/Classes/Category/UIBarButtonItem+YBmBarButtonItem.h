//
//  UIBarButtonItem+YBmBarButtonItem.h
//  BuDeJie
//
//  Created by ybm on 16/4/26.
//  Copyright © 2016年 ybm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YBmBarButtonItem)
+ (UIBarButtonItem *)item:(UIImage *)image highImage:(UIImage *)highImage target:( id)target action:(SEL)action;
+ (UIBarButtonItem *)item:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;
@end
