//
//  UILabel+Label.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UILabel (Label)

/** 快速创建Label */
+(instancetype)_labelWithText:(NSString *)text textFont:(int)font textColor:(UIColor *)color frame:(CGRect)frame;

/** 设置字间距 */
- (void)setColumnSpace:(CGFloat)columnSpace;

/** 设置行距 */
- (void)setRowSpace:(CGFloat)rowSpace;

@end
