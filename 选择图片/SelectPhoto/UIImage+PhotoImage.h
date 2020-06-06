//
//  UIImage+PhotoImage.h
//  选择图片
//
//  Created by JackX on 2020/6/4.
//  Copyright © 2020 App. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PhotoImage)

+(UIImage*)setThumbnailFromImage:(UIImage*)image  WithSize:(CGSize)size;

+(UIImage*)setThumbnailFromImage:(UIImage*)image  WithSize:(CGSize)size WithCornerRadius:(CGFloat)radius;


//保持原来的长宽进行裁剪
+(UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
//设置图片圆角
-(CAShapeLayer*)CornerType:(UIRectCorner)corner WithRect:(CGRect)rect WithRadiu:(CGSize)Radii;
//纠正图片方向
- (UIImage *)fixOrientation;
@end

NS_ASSUME_NONNULL_END
