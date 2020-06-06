//
//  NSArray+Array.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <Foundation/Foundation.h>

@interface NSArray (Array)
/** 反转数组 */
- (NSArray *)_reverseArray;
//判断数组是否为空 YES则为空，NO不为空
-(BOOL)IsArrEmpty;
/** 获取数组中的最大值  可用*/
- (CGFloat) _maxNumberFromArray;

/** 获取数组中的最小值 可用 */
- (CGFloat) _minNumberFromArray;

/** 获取数组的和 可用 */
- (CGFloat) _sumNumberFromArray;

/** 获取数组平均值  可用*/
- (CGFloat) _averageNumberFromArray;
@end
