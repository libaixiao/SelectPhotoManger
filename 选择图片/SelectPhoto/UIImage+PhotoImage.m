//
//  UIImage+PhotoImage.m
//  选择图片
//
//  Created by JackX on 2020/6/4.
//  Copyright © 2020 App. All rights reserved.
//

#import "UIImage+PhotoImage.h"

@implementation UIImage (PhotoImage)

+(UIImage*)setThumbnailFromImage:(UIImage *)image WithSize:(CGSize)size{
   return [self setThumbnailFromImage:image WithSize:size WithCornerRadius:0.0];
}


+(UIImage*)setThumbnailFromImage:(UIImage*)image  WithSize:(CGSize)size  WithCornerRadius:(CGFloat)radius{
    CGSize originImageSize = image.size;
    CGRect newRect =CGRectMake(0,0,size.width,size.height);
    //根据当前屏幕scaling factor创建一个透明的位图图形上下文(此处不能直接从UIGraphicsGetCurrentContext获取,原因是UIGraphicsGetCurrentContext获取的是上下文栈的顶,在drawRect:方法里栈顶才有数据,其他地方只能获取一个nil.详情看文档)
    UIGraphicsBeginImageContextWithOptions(newRect.size,NO,[UIScreen mainScreen].scale);
    //保持宽高比例,确定缩放倍数//(原图的宽高做分母,导致大的结果比例更小,做MAX后,ratio*原图长宽得到的值最小是40,最大则比40大,这样的好处是可以让原图在画进40*40的缩略矩形画布时,origin可以取=(缩略矩形长宽减原图长宽*ratio)/2 ,这样可以得到一个可能包含负数的origin,结合缩放的原图长宽size之后,最终原图缩小后的缩略图中央刚好可以对准缩略矩形画布中央)
    float ratio =MAX(newRect.size.width/ originImageSize.width, newRect.size.height/ originImageSize.height);
    //创建一个圆角的矩形UIBezierPath对象
    UIBezierPath*path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:radius];
    //用Bezier对象裁剪上下文
    [path addClip];
    //让image在缩略图范围内居中()
    CGRect projectRect;
    projectRect.size.width= originImageSize.width* ratio;
    projectRect.size.height= originImageSize.height* ratio;projectRect.origin.x= (newRect.size.width- projectRect.size.width) /2;
    projectRect.origin.y= (newRect.size.height- projectRect.size.height) /2;
    //在上下文中画图
    [image drawInRect:projectRect];
    //从图形上下文获取到UIImage对象,赋值给thumbnai属性
    UIImage*smallImg =UIGraphicsGetImageFromCurrentImageContext();
    //清理图形上下文(用了UIGraphicsBeginImageContext需要清理)
    UIGraphicsEndImageContext();
    return smallImg;
}


//保持原来的宽高
+(UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize

{
    UIImage *newimage;
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        CGSize oldsize = image.size;
        
        CGRect rect;
        
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            
            rect.size.height = asize.height;
            
            rect.origin.x = (asize.width - rect.size.width)/2;
            
            rect.origin.y = 0;
        }
        
        else{
            
            rect.size.width = asize.width;
            
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            
            rect.origin.x = 0;
            
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        UIGraphicsBeginImageContextWithOptions(asize, NO,[UIScreen mainScreen].scale);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        
        [image drawInRect:rect];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
}



//设置图片的圆角
-(CAShapeLayer*)CornerType:(UIRectCorner)corner WithRect:(CGRect)rect WithRadiu:(CGSize)Radii{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:Radii]; // UIRectCornerBottomRight通过这个设置
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    return maskLayer;
}


- (UIImage *)fixOrientation{
    CGAffineTransform transform = CGAffineTransformIdentity;
       
       switch (self.imageOrientation) {
           case UIImageOrientationDown:
           case UIImageOrientationDownMirrored:
               transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
               transform = CGAffineTransformRotate(transform, M_PI);
               break;
               
           case UIImageOrientationLeft:
           case UIImageOrientationLeftMirrored:
               transform = CGAffineTransformTranslate(transform, self.size.width, 0);
               transform = CGAffineTransformRotate(transform, M_PI_2);
               break;
               
           case UIImageOrientationRight:
           case UIImageOrientationRightMirrored:
               transform = CGAffineTransformTranslate(transform, 0, self.size.height);
               transform = CGAffineTransformRotate(transform, -M_PI_2);
               break;
           default:
               break;
       }
       
       switch (self.imageOrientation) {
           case UIImageOrientationUpMirrored:
           case UIImageOrientationDownMirrored:
               transform = CGAffineTransformTranslate(transform, self.size.width, 0);
               transform = CGAffineTransformScale(transform, -1, 1);
               break;
               
           case UIImageOrientationLeftMirrored:
           case UIImageOrientationRightMirrored:
               transform = CGAffineTransformTranslate(transform, self.size.height, 0);
               transform = CGAffineTransformScale(transform, -1, 1);
               break;
           default:
               break;
       }
       
       // Now we draw the underlying CGImage into a new context, applying the transform
       // calculated above.
       CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                                CGImageGetBitsPerComponent(self.CGImage), 0,
                                                CGImageGetColorSpace(self.CGImage),
                                                CGImageGetBitmapInfo(self.CGImage));
       CGContextConcatCTM(ctx, transform);
       switch (self.imageOrientation) {
           case UIImageOrientationLeft:
           case UIImageOrientationLeftMirrored:
           case UIImageOrientationRight:
           case UIImageOrientationRightMirrored:
               // Grr...
               CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
               break;
               
           default:
               CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
               break;
       }
       // And now we just create a new UIImage from the drawing context
       CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
       UIImage *img = [UIImage imageWithCGImage:cgimg];
       CGContextRelease(ctx);
       CGImageRelease(cgimg);
       return img;
}

@end
