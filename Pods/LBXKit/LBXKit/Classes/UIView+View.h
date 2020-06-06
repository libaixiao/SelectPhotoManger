//
//  UIView+View.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

typedef void (^TapActionBlock)(UITapGestureRecognizer *gestureRecoginzer);
typedef void (^LongPressActionBlock)(UILongPressGestureRecognizer *gestureRecoginzer);

@interface UIView (View)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/** 截取成图片 */
- (UIImage *)_snapshotImage;

/** 触发点击事件 */
- (void)_addTapActionWithBlock:(TapActionBlock)block;

/** 触发长按事件 */
- (void)_addLongPressActionWithBlock:(LongPressActionBlock)block;

/** 找到指定类名的subView */
- (UIView *)_findSubViewWithClass:(Class)clazz;

/** 找到指定类名的所有subView */
- (NSArray *)_findAllSubViewsWithClass:(Class)clazz;

/** 找到指定类名的superView对象 */
- (UIView *)_findSuperViewWithClass:(Class)clazz;

/** 找到view上的第一响应者 */
- (UIView *)_findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)_findViewController;

/** 所有子View */
- (NSArray *)_allSubviews;

/** 移除所有子视图 */
- (void)_removeAllSubviews;

@property (assign,nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic) IBInspectable BOOL masksToBounds;
@property (assign,nonatomic) IBInspectable NSInteger borderWidth;
@property (strong,nonatomic) IBInspectable NSString  *borderHexRgb;
@property (strong,nonatomic) IBInspectable UIColor   *borderColor;

+ (instancetype)_loadViewFromNib;
+ (instancetype)_loadViewFromNibWithName:(NSString *)nibName;
+ (instancetype)_loadViewFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)_loadViewFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
