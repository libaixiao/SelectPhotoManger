//
//  Methods.m
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//

#import "Methods.h"

@interface Methods ()

@end

@implementation Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

+ (void)_setStatusBarBackgroundColor:(UIColor *)color
{
    if (@available(iOS 13.0, *)) {
         UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].windows[0].windowScene.statusBarManager.statusBarFrame];
         statusBar.backgroundColor = color;
         [[UIApplication sharedApplication].windows[0] addSubview:statusBar];
    }else{
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
           if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
           {
               statusBar.backgroundColor = color;
           }
    }
}


+(void)_addBackgroundImageWithImageName:(NSString *)imageName forViewController:(UIViewController *)viewController {
    //给控制器添加背景图片
    UIImage *oldImage = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(viewController.view.frame.size, NO, 0.0);
    [oldImage drawInRect:viewController.view.bounds];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    viewController.view.backgroundColor = [UIColor colorWithPatternImage:newImage];
}


//+ (CGFloat) _maxNumberFromArray:(NSArray *)array {
//    CGFloat max = 0;
//    max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
//    return max;
//}
//
//+ (CGFloat) _minNumberFromArray:(NSArray *)array{
//    CGFloat min = 0;
//    min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
//    return min;
//}
//
//+ (CGFloat) _sumNumberFromArray:(NSArray *)array{
//    CGFloat sum = 0;
//    sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
//    return sum;
//}
//
//+ (CGFloat) _averageNumberFromArray:(NSArray *)array{
//    CGFloat avg = 0;
//    avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
//    return avg;
//}


+ (CGFloat) _usableHardDriveCapacity {
    CGFloat usable = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    usable = [attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3);
    NSLog(@"可用%.2fG",[attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3));
    return usable;
}


+ (CGFloat) _allHardDriveCapacity {
    CGFloat all = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    all = [attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3));
    NSLog(@"容量%.2fG",[attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3)));
    return all;
}

@end
