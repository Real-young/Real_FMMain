//
//  YbmTabbarController.m
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import "YbmTabbarController.h"
#import "YbmTabBar.h"
#import "YbmNavigationController.h"
#import "YbmMiddleView.h"
#import "UIImage+Image.h"
@interface YbmTabbarController ()

@end

@implementation YbmTabbarController

+ (instancetype)shareInstance {
    
    static YbmTabbarController *tabbarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarC = [[YbmTabbarController alloc] init];
    });
    return tabbarC;
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(YbmTabbarController *tabBarC))addVCBlock {
    
    YbmTabbarController *tabbarVC = [[YbmTabbarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    
    return tabbarVC;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabbar
    [self setUpTabbar];
    
}

- (void)setUpTabbar {
    [self setValue:[[YbmTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        YbmNavigationController *nav = [[YbmNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageWithOriginalImageName:normalImageName] selectedImage:[UIImage imageWithOriginalImageName:selectedImageName]];
        
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    UIViewController *vc = self.childViewControllers[selectedIndex];
    if (vc.view.tag == 666) {
        vc.view.tag = 888;
        
        YbmMiddleView *middleView = [YbmMiddleView middleView];
        middleView.middleClickBlock = [YbmMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [YbmMiddleView shareInstance].isPlaying;
        middleView.middleImg = [YbmMiddleView shareInstance].middleImg;
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [vc.view addSubview:middleView];
        
    }
    
    
}

@end
