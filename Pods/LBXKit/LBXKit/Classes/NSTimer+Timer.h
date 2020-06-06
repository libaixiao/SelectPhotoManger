//
//  NSTimer+Timer.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <Foundation/Foundation.h>

typedef void(^TimerCallback)(NSTimer *timer);

@interface NSTimer (Timer)

/**
 定时事件，自定义是否重复

 @param interval 时间间隔
 @param repeats 是否重复
 @param callback 回调
 @return timer
 */
+ (NSTimer *)_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                      callback:(TimerCallback)callback;

/**
 定时事件，自定义重复次数

 @param interval 时间间隔
 @param count 重复次数
 @param callback 回调
 @return timer
 */
+ (NSTimer *)_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         count:(NSInteger)count
                                      callback:(TimerCallback)callback;

/** 暂停timer */
- (void)pauseTimer;

/** 开始timer */
- (void)resumeTimer;

/** 延迟开始timer */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
