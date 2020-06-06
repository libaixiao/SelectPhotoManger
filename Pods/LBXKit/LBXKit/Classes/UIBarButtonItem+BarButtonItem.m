//
//  UIBarButtonItem+BarButtonItem.m
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//

#import "UIBarButtonItem+BarButtonItem.h"

@implementation UIBarButtonItem (BarButtonItem)

+(instancetype _Nullable )_barButtonItemWithTitle:(NSString *_Nullable)title imageName:(NSString *_Nullable)imageName target:(nullable id)target action:(nonnull SEL)action fontSize:(CGFloat)fontSize titleNormalColor:(UIColor *_Nullable)normalColor titleHighlightedColor:(UIColor *_Nullable)highlightedColor {
    
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
