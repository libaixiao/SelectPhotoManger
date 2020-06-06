//
//  NSNumber+Number.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <Foundation/Foundation.h>

@interface NSNumber (Number)

/** 对应的罗马数字 */
- (NSString *)romanNumeral;

/** 转换为百分比字符串 */
- (NSString*)toDisplayPercentageWithDigit:(NSInteger)digit;

/**
 四舍五入

 @param digit 限制最大位数
 @return 四舍五入后的结果
 */
- (NSNumber*)doRoundWithDigit:(NSUInteger)digit;

/**
 上取整

 @param digit 限制最大位数
 @return 上取整后的结果
 */
- (NSNumber*)doCeilWithDigit:(NSUInteger)digit;

/**
 下取整

 @param digit 限制最大位数
 @return 下取整后的结果
 */
- (NSNumber*)doFloorWithDigit:(NSUInteger)digit;

- (NSString*)toDisplayNumberWithDigit:(NSInteger)digit;

@end
