//
//  YbmNavigationController.m
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import "YbmNavigationController.h"
#import "YbmNavigationBar.h"
#import "YbmMiddleView.h"
@interface YbmNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation YbmNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置手势代理
    UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    // 手势加在谁身上, 手势执行谁的什么方法
    UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc] initWithTarget:gester.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    
    [gester.view addGestureRecognizer:panGester];
    gester.delaysTouchesBegan = YES;
    panGester.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[YbmNavigationBar alloc] init] forKey:@"navigationBar"];
    }
    return self;
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        
        //统一设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:0 target:self action:@selector(back)];
    }
    //调用父类
    [super pushViewController:viewController animated:animated];
    
    if (viewController.view.tag == 666) {
        viewController.view.tag = 888;
        
    }
    
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.childViewControllers.count == 1) {
        return NO;
    } else {
        return YES;
    }
}

@end
