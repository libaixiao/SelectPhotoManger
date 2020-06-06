//
//  UIImageView+ImageView.m
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//

#import "UIImageView+ImageView.h"

@implementation UIImageView (ImageView)

+(instancetype)_imageViewWithPNGImage:(NSString *)imageName frame:(CGRect)frame {
    UIImageView *imageV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageV.frame=frame;
    return imageV;
}

@end
