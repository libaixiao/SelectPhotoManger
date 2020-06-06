//
//  SelectPhotoManager.h
//  选择图片
//
//  Created by JackX on 2020/6/2.
//  Copyright © 2020 App. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SelectPhotoManager;

@protocol SelectPotoDelegate <NSObject>
@optional
//照片选取成功
-(void)selectPhotoMangerDidFinishImage:(UIImage*_Nullable)image;
//照片选取失败
-(void)selectPhotoMagerDidError:(NSError*_Nullable)error;
@end

//图片选择(是相册还是相机)
typedef NS_ENUM(NSInteger,SelectPhotoType) {
    PhotoCamera = 0,
    PhotoAlbum,
};

//错误码回调
typedef NS_ENUM(NSInteger,SelectPhotoErrorTag){
    //相机不可用
    SelectPhotoErrorTagNoCAmera = 1,
    //撤销
    SelectPhotoTagCancel,
    //相册不可用
    SelectErrorTagNoAlbum,
    //类型错误
    SelectPhotoErrorTagTypeError,
    //保存图片不可用
    SlectPhotoErrorTagSavePhotoAlbum,
};

//当前相册认证的状态
typedef NS_ENUM(NSInteger,PhotoAuthorizaionStatus){
    //用户未做出选择
    AuthirizationStatusNotDetermined = 0,
    //此应用没有被授权访问的照片数据，可能是家长控制权限
    AuthorizationStatusRefuse,
    //用户已经明确否认了这一照片数据的应用程序访问
//    PhotoAuthorizaionStatusDenied,
    //用户已经授权应用程序访问照片数据
//    PhotoAuthorizaionStatusAuthirized,
//    //ios 8以后可用，等 PhotoAuthorizaionStatusAuthirized
     AuthorizaionStatusAutuhirizedAlways,
//    //iOS 8以后可用，用户是否勾选了APP在前台时，才允许访问相册
//    PhotoAuthorizaionStatusAuthorizedWhenInUse,
    
};

//当前相机认证的状态
typedef NS_ENUM(NSInteger,CameraAuthirizaionStatus){
    CameraAuthirizaionStatusDetermined = 0,
    CameraAuthirizaionStatusRefuse,
    CameraAuthirizaionStatusAuthorized,
};


//成功回调
typedef void(^successHandle)(SelectPhotoManager * _Nullable manager,UIImage * _Nullable selectImg);
//失败回调
typedef void(^errorHandle)(SelectPhotoErrorTag  error);
//触发相机回调
typedef void(^AuthorizationHandle)(BOOL authorization);


NS_ASSUME_NONNULL_BEGIN
@interface SelectPhotoManager : NSObject<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate>
@property(nonatomic,weak)__weak id<SelectPotoDelegate>selectphotodelegate;
//相册编辑功能
@property(nonatomic,assign)BOOL CanEditPhoto;
//跳转的控制器,不能为空
@property(nonatomic,weak)UIViewController *currrentVc;

@property(nonatomic,copy)successHandle successhandle;
@property(nonatomic,copy)errorHandle errorhandle;

//单利初始化(也可以用init初始化)
+(instancetype)ShareInstance;
//开始选取图片
-(void)startSelectPhoto;

//-(void)startSelectPhotoWithImageName:(NSString*)name;
////根据类型选择照片,可以传SelectPhotoType枚举值里的一个，只有相册或拍照，在回调里拿到结果*/
//-(void)startSelectPhotoWithType:(SelectPhotoType)type;

//#pragma mark -有回调方法，默认是弹actionsSheet,从相册或者拍照，再回调中拿到结果
//- (void)startSelectPhotoSuccess:(successHandle)success failure:(errorHandle)failure;
///**根据传入type类型选取照片*/
//- (void)startSelectPhotoWithType:(SelectPhotoType )type success:(successHandle)success failure:(errorHandle)failure;
@end


NS_ASSUME_NONNULL_END
