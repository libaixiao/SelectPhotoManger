//
//  UIColor+Color.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UIColor (Color)

/** 16进制数字创建颜色 */
+ (instancetype)_colorWithHex:(uint32_t)hex;

/** 随机色 */
+ (instancetype)_randomColor;

/** RGB颜色 */
+ (instancetype)_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

/**
 十六进制字符串显示颜色
 
 @param color 十六进制字符串
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 *  @brief  渐变颜色
 *
 *  @param fromColor  开始颜色
 *  @param toColor    结束颜色
 *  @param height     渐变高度
 *
 *  @return 渐变颜色 需要放在CALayer+Layer类中，利用CAGradientLayer实现
 */
//+ (UIColor*)_gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;

@end
