//
//  Methods.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface Methods : UIViewController

/** 更改iOS状态栏的颜色*/
+ (void)_setStatusBarBackgroundColor:(UIColor *)color;

/** 为控制器添加背景图片 可用*/
+ (void)_addBackgroundImageWithImageName:(NSString *)imageName forViewController:(UIViewController *)viewController;

///** 获取数组中的最大值  可用*/
//+ (CGFloat) _maxNumberFromArray:(NSArray *)array;
//
///** 获取数组中的最小值 可用 */
//+ (CGFloat) _minNumberFromArray:(NSArray *)array;
//
///** 获取数组的和 可用 */
//+ (CGFloat) _sumNumberFromArray:(NSArray *)array;
//
///** 获取数组平均值  可用*/
//+ (CGFloat) _averageNumberFromArray:(NSArray *)array;

/** 可用硬件容量 可用 */
+ (CGFloat) _usableHardDriveCapacity;

/** 硬件总容量  可用*/
+ (CGFloat) _allHardDriveCapacity;

@end
