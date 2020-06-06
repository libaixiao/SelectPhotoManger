//
//  UIViewController+VC.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UIViewController (VC)

/** 找到当前视图控制器 */
+ (UIViewController *)_currentViewController;

/** 找到当前导航控制器 */
+ (UINavigationController *)_currentNavigatonController;

/** 在当前视图控制器中添加子控制器，将子控制器的视图添加到view中 */
- (void)_addChildController:(UIViewController *)childController intoView:(UIView *)view;

@end
