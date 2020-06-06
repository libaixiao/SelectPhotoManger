//
//  SelectPhotoManager.m
//  选择图片
//
//  Created by JackX on 2020/6/2.
//  Copyright © 2020 App. All rights reserved.


#import "SelectPhotoManager.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import "UIImage+PhotoImage.h"
//#pragma clang diagnostic ignored "-Wdeprecated-declarations"//消除方法过期的警告
@interface SelectPhotoManager()
@property(nonatomic,strong)NSString *imageName;
@end

static SelectPhotoManager *sharedInstance = nil;

@implementation SelectPhotoManager
//单利
+(instancetype)ShareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SelectPhotoManager alloc]init];
    });
 
    return sharedInstance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - imagePickerController协议方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //NSLog(@"info = %@",info);
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (image == nil) {
        image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    }
    //图片旋转
    if (image.imageOrientation != UIImageOrientationUp) {
        //图片旋转
        image = [image fixOrientation];
    }
    
    if (self.imageName==nil || self.imageName.length == 0) {
        //获取当前时间,生成图片路径
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
        NSString *dateStr = [formatter stringFromDate:date];
        self.imageName = [NSString stringWithFormat:@"photo_%@.png",dateStr];
    }
    
    
    
    [self.currrentVc dismissViewControllerAnimated:YES completion:nil];
    if (self.selectphotodelegate && [self.selectphotodelegate respondsToSelector:@selector(selectPhotoMangerDidFinishImage:)]) {
        [self.selectphotodelegate selectPhotoMangerDidFinishImage:image];
    }
    
    if (_successhandle) {
        _successhandle(self,image);
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.currrentVc dismissViewControllerAnimated:YES completion:nil];
     picker = nil;
//    if (self.selectphotodelegate && [self.selectphotodelegate respondsToSelector:@selector(selectPhotoManagerDidError:)]) {
//        [self.selectphotodelegate selectPhotoMagerDidError:nil];
//    }
//    !self.errorHandle?:self.errorHandle(YBSelectPhotoErrorTagCancel);
}

#pragma mark public
- (void)startSelectPhoto{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];
       UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
       [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
               [self selectPhotoWithType:PhotoCamera];
             }]];
    
       [alertController addAction: [UIAlertAction actionWithTitle: @"从相册获取" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self selectPhotoWithType:PhotoAlbum];
       }]];
    
      [alertController addAction:cancelAction];
      [self.currrentVc presentViewController:alertController animated:YES completion:nil];
}




-(void)selectPhotoWithType:(NSInteger)type{
    
    if (type>=2) {
        //类型错误
        NSLog(@"类型错误");
        return;
    }
    
    //打开相册
    if (type==PhotoAlbum) {
        
        [self PhotoAlbum];
        
    }else{
    //打开相机
        [self camera];
    }
}


-(void)PhotoAlbum{
    
    PhotoAuthorizaionStatus status = [self currentPhotoAuthorizationIsStatus];
    
    if (status==0) {
        
        [self showPhotoAlbumAuthorization:^(BOOL authorization) {
            if (authorization) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self PhotoAlbum];
                });
            }else{
                NSLog(@"取消相册权限");
            }
        }];
        
    }else if (status==1){
        
        [self  showPhotosSettingAlert];
        
    }else{
        
        [self showSysyemPhoto];
    
    }
}

-(void)camera{
    CameraAuthirizaionStatus status = [self currentCameraAuthorizationIsStatus];
    if (status==0) {
        [self showCameraAuthorization:^(BOOL authorization) {
            if (authorization) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self camera];
            });
            }else{
                NSLog(@"取消相机权限");
            }
        }];
       }else if(status==1){
           
         [self  showCameraSettingAlert];
           
       }else{
           
          [self showCamera];
       
     }
}

#pragma mark 相册
//主动触发相册的授权提示
-(void)showPhotoAlbumAuthorization:(void(^)(BOOL authorization))handle{
    //iOS8之前 APP 第一次访问相册 系统弹窗 方法的拦截
       if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusNotDetermined) {
           ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
           [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
               // 用户点击 "OK"
               !handle?:handle(YES);
           } failureBlock:^(NSError *error) {
               // 用户点击 不允许访问
               !handle?:handle(NO);
           }];
       }
       
       //iOS8之后 APP 第一次访问相册 系统弹窗 方法的拦截
       PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
       if (status == PHAuthorizationStatusNotDetermined) {
           [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
               if(status == PHAuthorizationStatusAuthorized) {
                   dispatch_async(dispatch_get_main_queue(), ^{
                       // 用户点击 "OK"
                       !handle?:handle(YES);
                   });
               } else {
                   dispatch_async(dispatch_get_main_queue(), ^{
                       // 用户点击 不允许访问
                       !handle?:handle(NO);
                   });
               }
           }];
       }
}

/**
 当相册无授权时，弹窗提示
 */
- (void)showPhotosSettingAlert {
    NSString *message = [NSString stringWithFormat:@"请先去设置允许APP访问您的相册"];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle: UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message];
    [messageAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, message.length)];
    [messageAtt addAttribute:NSForegroundColorAttributeName value:[UIColor darkTextColor] range:NSMakeRange(0, message.length)];
    [alertController setValue:messageAtt forKey:@"attributedMessage"];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([[[UIDevice currentDevice]systemVersion]floatValue]<10.0) {

                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

            }else{

                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                      NSLog(@"回调成功");
                }];
                
            }
              });
    }]];
    
    [self.currrentVc presentViewController:alertController animated:YES completion:nil];
}


//跳转到相册库
-(void)showSysyemPhoto{
    UIImagePickerController *ipVC = [[UIImagePickerController alloc] init];
       //设置跳转方式
       ipVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
       ipVC.allowsEditing = self.CanEditPhoto;
       ipVC.delegate = self;
       BOOL isPhotoLibrarySource = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
        if (!isPhotoLibrarySource) {
            NSLog(@"当前相册不可用");
            return;
        }
       ipVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
       [self.currrentVc presentViewController:ipVC animated:YES completion:nil];
}


#pragma mark 相机
- (void)showCameraAuthorization:(void(^)(BOOL authorization))handle {
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
        if (granted) {//允许
            !handle?:handle(YES);
        }else {
            !handle?:handle(NO);
        }
    }];
}

- (void)showCameraSettingAlert {
    NSString *message = @"请先去设置允许APP访问您的相机";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle: UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message];
    [messageAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, message.length)];
    [messageAtt addAttribute:NSForegroundColorAttributeName value:[UIColor darkTextColor] range:NSMakeRange(0, message.length)];
    [alertController setValue:messageAtt forKey:@"attributedMessage"];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        dispatch_async(dispatch_get_main_queue(), ^{
           if ([[[UIDevice currentDevice]systemVersion]floatValue]<10.0) {

                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

            }else{
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                                NSLog(@"回调成功");
                  }];
                    
                }
        });
    }]];
    [self.currrentVc presentViewController:alertController animated:YES completion:nil];
}

-(void)showCamera{
    UIImagePickerController *ipVC = [[UIImagePickerController alloc] init];
        //设置跳转方式
        ipVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        ipVC.allowsEditing = self.CanEditPhoto;
        ipVC.delegate = self;
        BOOL isCameraSource = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
        BOOL isCameraDevice = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCameraDevice || !isCameraSource) {
            NSLog(@"当前相机不可用");
            return ;
        }
         ipVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.currrentVc presentViewController:ipVC animated:YES completion:nil];
}


#pragma mark 相册相机的权限判断
- (PhotoAuthorizaionStatus)currentPhotoAuthorizationIsStatus{
    //判断当前iOS版本是否小于8
    BOOL IsLessThanIOS_8 = ([[[UIDevice currentDevice] systemVersion] floatValue]<8.0)?YES:NO;
    
    if (IsLessThanIOS_8) {
         ALAuthorizationStatus kclAuthor = [ALAssetsLibrary authorizationStatus];
        if (kclAuthor == kCLAuthorizationStatusRestricted||
            kclAuthor == kCLAuthorizationStatusDenied) {
            return AuthorizationStatusRefuse;
        }else if (kclAuthor==kCLAuthorizationStatusNotDetermined){
            return AuthirizationStatusNotDetermined;
        }
        
    }else{
        
        PHAuthorizationStatus phauthor  = [PHPhotoLibrary authorizationStatus];
        if (phauthor==PHAuthorizationStatusRestricted||
            phauthor==PHAuthorizationStatusDenied) {
          return AuthorizationStatusRefuse;
        }else if (phauthor==PHAuthorizationStatusNotDetermined){
            return AuthirizationStatusNotDetermined;
        }
        
    }
    return  AuthorizaionStatusAutuhirizedAlways;
}


-(CameraAuthirizaionStatus)currentCameraAuthorizationIsStatus{
   AVAuthorizationStatus author =  [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (author == AVAuthorizationStatusNotDetermined) {
        return CameraAuthirizaionStatusDetermined;
        
    }else if (author == AVAuthorizationStatusDenied||
              author == AVAuthorizationStatusRestricted){
        return CameraAuthirizaionStatusRefuse;
    }
    
    return CameraAuthirizaionStatusAuthorized;
}

@end
