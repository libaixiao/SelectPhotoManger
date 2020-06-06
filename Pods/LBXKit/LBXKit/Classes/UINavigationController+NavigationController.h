//
//  UINavigationController+NavigationController.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UINavigationController (NavigationController)

/** 寻找Navigation中的某个viewcontroler */
- (id)findViewController:(Class)className;

/** 判断是否只有一个RootViewController */
- (BOOL)isOnlyContainRootViewController;

/** RootViewController */
- (UIViewController *)rootViewController;

/** 返回指定的viewcontroler */
- (NSArray *)popToViewControllerWithClassName:(Class)className animated:(BOOL)animated;

/** pop回第n层 */
- (NSArray *)popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

/** 以某种动画形式push */
- (void)pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;

/** 以某种动画形式pop */
- (UIViewController *)popViewControllerWithTransition:(UIViewAnimationTransition)transition;

@end
