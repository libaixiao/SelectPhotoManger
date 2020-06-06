//
//  UIImage+Image.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

typedef void (^UIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);
typedef void(^ImageBlock)(NSData *imageData);
@interface UIImage (Image)

/** 截屏 */
+(instancetype)_snapshotCurrentScreen;

/** 图片模糊效果 */
- (UIImage *)blur;

/** 圆角图片 */
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;

/** 圆角图片 */
- (UIImage*)_imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

/** 圆形图片 */
+ (UIImage *)_GetRoundImagewithImage:(UIImage *)image;

/** 在图片上加居中的文字 */
- (UIImage *)_imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;

//保持原来的宽高,裁剪成想要的尺寸
-(UIImage *)_thumbnailWithImageWithoutsize:(CGSize)asize;

/**
 内存处理，循环压缩处理，图片处理过程中内存不会爆增
 @param fImageKBytes 限制最终的文件大小
 @param block 处理之后的数据返回，data类型
 */
- (void)compressedImageKB:(CGFloat)fImageKBytes imageBlock:(void(^)(NSData *imageData))block;

/**
 图片压缩（针对内存爆表出现的压缩失真分层问题的使用工具）

 @param fImageKBytes 最终限制
 @param block 处理之后的数据返回，data类型
 */
- (void)resetSizeimageKB:(CGFloat)fImageKBytes imageBlock:(ImageBlock)block;
/**
 取图片某一像素点的颜色
 
 @param point 图片上的某一点
 @return 图片上这一点的颜色
 */
- (UIColor *)_colorAtPixel:(CGPoint)point;

/**
 生成一个纯色的图片
 
 @param color 图片颜色
 @return 返回的纯色图片
 */
- (UIImage *)_imageWithColor:(UIColor *)color;

/** 获得灰度图 */
- (UIImage *)_convertToGrayImage;

/** 合并两个图片为一个图片 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

/** 压缩图片 最大字节大小为maxLength */
- (NSData *)compressWithMaxLength:(NSInteger)maxLength;

/** 纠正图片的方向 */
- (UIImage *)fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)flipVertical;

/** 水平翻转 */
- (UIImage *)flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/** 截取当前image对象rect区域内的图像 */
- (UIImage *)subImageWithRect:(CGRect)rect;

/** 压缩图片至指定尺寸 */
- (UIImage *)rescaleImageToSize:(CGSize)size;

/** 压缩图片至指定像素 */
- (UIImage *)rescaleImageToPX:(CGFloat )toPX;

/** 在指定的size里面生成一个平铺的图片 */
- (UIImage *)getTiledImageWithSize:(CGSize)size;

/** UIView转化为UIImage */
+ (UIImage *)imageFromView:(UIView *)view;

/** 返回截取得到图片的某一块rect */
- (UIImage *)imageCroppedToRect:(CGRect)rect;

/** 倒影 */
- (UIImage *)reflectedImageWithScale:(CGFloat)scale;

/** 倒影 */
- (UIImage *)imageWithReflectionWithScale:(CGFloat)scale gap:(CGFloat)gap alpha:(CGFloat)alpha;

/**
 带有阴影的图片

 @param color 颜色
 @param offset offset
 @param blur 模糊度，可以先设置个20试试
 @return 带有阴影的图片
 */
- (UIImage *)imageWithShadowColor:(UIColor *)color offset:(CGSize)offset blur:(CGFloat)blur;

/**
 透明图片

 @param alpha 透明度
 @return 透明图片
 */
- (UIImage *)imageWithAlpha:(CGFloat)alpha;

+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;
- (UIImage *)imageScaledToSize:(CGSize)size;
- (UIImage *)imageScaledToFitSize:(CGSize)size;
- (UIImage *)imageScaledToFillSize:(CGSize)size;
- (UIImage *)imageCroppedAndScaledToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode padToFit:(BOOL)padToFit;
- (UIImage *)imageWithMask:(UIImage *)maskImage;
- (UIImage *)maskImageFromImageAlpha;

@end
