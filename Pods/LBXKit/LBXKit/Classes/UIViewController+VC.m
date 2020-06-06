//
//  UIViewController+VC.m
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//

#import "UIViewController+VC.h"

@implementation UIViewController (VC)

+ (UIViewController *)findBestViewController:(UIViewController *)vc
{
    if (vc.presentedViewController)
    {
        return [self findBestViewController:vc.presentedViewController];
    }
    else if ([vc isKindOfClass:[UISplitViewController class]])
    {
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
        {
            return [self findBestViewController:svc.viewControllers.lastObject];
        }
        else
        {
            return vc;
        }
        
    }
    else if ([vc isKindOfClass:[UINavigationController class]])
    {
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
        {
            return [self findBestViewController:svc.topViewController];
        }
        else
        {
            return vc;
        }
        
    }
    else if ([vc isKindOfClass:[UITabBarController class]])
    {
        UITabBarController* svc = (UITabBarController *)vc;
        if (svc.viewControllers.count > 0)
        {
            return [self findBestViewController:svc.selectedViewController];
        }
        else
        {
            return vc;
        }
        
    }
    else
    {
        return vc;
    }
}

+ (UIViewController *)_currentViewController
{
    UIViewController *viewController = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    return [UIViewController findBestViewController:viewController];
}

+ (UINavigationController *)_currentNavigatonController {
    
    UIViewController * currentViewController =  [UIViewController _currentViewController];
    
    return currentViewController.navigationController;
}

- (void)_addChildController:(UIViewController *)childController intoView:(UIView *)view  {
    
    [self addChildViewController:childController];
    
    [view addSubview:childController.view];
    
    [childController didMoveToParentViewController:self];
}


@end
