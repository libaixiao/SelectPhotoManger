//
//  CALayer+Layer.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2017/7/7.
//   
//  

#import "CALayer+Layer.h"

@implementation CALayer (Layer)

-(void)shake{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat shakeWidth = 16;
    keyAnimation.values = @[@(-shakeWidth),@(0),@(shakeWidth),@(0),@(-shakeWidth),@(0),@(shakeWidth),@(0)];
    //时长
    keyAnimation.duration = .1f;
    //重复
    keyAnimation.repeatCount =2;
    //移除
    keyAnimation.removedOnCompletion = YES;
    [self addAnimation:keyAnimation forKey:@"shake"];
}

@end
