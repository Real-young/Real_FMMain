//
//  YbmMiddleView.m
//  test
//
//  Created by ybm on 2018/2/8.
//  Copyright © 2018年 ybm. All rights reserved.
//

#import "YbmMiddleView.h"
#import "CALayer+YbmPauseAimate.h"
@interface YbmMiddleView()
//播放按钮
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
//内容视图
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;

@end

@implementation YbmMiddleView

static YbmMiddleView *_shareInstance;

+ (instancetype)shareInstance {
    if (_shareInstance == nil) {
        _shareInstance = [YbmMiddleView middleView];
    }
    return _shareInstance;
}

+ (instancetype)middleView {
    
    //    NSBundle *mainBundle = [NSBundle mainBundle];
    NSBundle *currenBundle = [NSBundle bundleForClass:self];
    
    
    YbmMiddleView *middleView = [[currenBundle loadNibNamed:@"YbmMiddleView" owner:nil options:nil] firstObject];
    return middleView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.middleImageView.layer.masksToBounds = YES;
    self.middleImg = self.middleImageView.image;
    
    [self.middleImageView.layer removeAnimationForKey:@"playAnnimation"];
    
    CABasicAnimation *basicAnnimation = [[CABasicAnimation alloc] init];
    basicAnnimation.keyPath = @"transform.rotation.z";
    basicAnnimation.fromValue = @0;
    basicAnnimation.toValue = @(M_PI * 2);
    basicAnnimation.duration = 30;
    basicAnnimation.repeatCount = MAXFLOAT;
    basicAnnimation.removedOnCompletion = NO;
    [self.middleImageView.layer addAnimation:basicAnnimation forKey:@"playAnnimation"];
     
     
    [self.middleImageView.layer pauseAnimate];
    [self.playBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //监听播放状态的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlay:) name:@"playState" object:nil];
    
    //坚挺播放图片的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
    
    
}

- (void)btnClick:(UIButton *) btn {
    if (self.middleClickBlock) {
        self.middleClickBlock(self.isPlaying);
    }
}

- (void)isPlayerPlay:(NSNotification *)notification {
    BOOL isPlay = [notification.object boolValue];
    self.isPlaying = isPlay;
}

- (void)setPlayImage:(NSNotification *)notification {
    UIImage *image = notification.object;
    self.middleImg = image;
}

- (void)setIsPlaying:(BOOL)isPlaying {
    
    if (_isPlaying == isPlaying) {
        return;
    }
    _isPlaying = isPlaying;
    if (isPlaying) {
        [self.playBtn setImage:nil forState:UIControlStateNormal];
        [self.middleImageView.layer resumeAnimate];
        
    }else {
        
        UIImage *image = [UIImage imageNamed:@"tabbar_np_play"];
        [self.playBtn setImage:image forState:UIControlStateNormal];
        
        [self.middleImageView.layer pauseAnimate];
    }
}

-(void)setMiddleImg:(UIImage *)middleImg {
    _middleImg = middleImg;
    self.middleImageView.image = middleImg;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.middleImageView.layer.cornerRadius = self.middleImageView.frame.size.width * 0.5;
}

//移除通知
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
