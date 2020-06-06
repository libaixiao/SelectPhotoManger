//
//  UIImageView+ImageView.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UIImageView (ImageView)

/** 快速创建imageView */
+(instancetype)_imageViewWithPNGImage:(NSString *)imageName frame:(CGRect)frame;

@end
