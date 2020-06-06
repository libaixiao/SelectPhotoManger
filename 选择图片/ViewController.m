//
//  ViewController.m
//  选择图片
//
//  Created by JackX on 2020/5/31.
//  Copyright © 2020 App. All rights reserved.
//

#import "ViewController.h"
#import "SelectPhotoManager.h"
#import "Kit.h"
@interface ViewController ()<SelectPotoDelegate>
@property(nonatomic,strong)UIImageView *ImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100,100, 100,100)];
    [self.view addSubview:self.ImageView];
    
    [SelectPhotoManager  ShareInstance].currrentVc = self;
    [SelectPhotoManager ShareInstance].CanEditPhoto = YES;
    [SelectPhotoManager ShareInstance].selectphotodelegate = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [[SelectPhotoManager ShareInstance]startSelectPhoto];
    });
    
    // Do any additional setup after loading the view.
}


- (void)selectPhotoMangerDidFinishImage:(UIImage *)image{
    
    UIImage *resImage =[image _thumbnailWithImageWithoutsize:self.ImageView.size];
    
    [resImage compressedImageKB:500 imageBlock:^(NSData *imageData) {
        NSString *str =  [self length:imageData.length];
        NSLog(@"%@",str);
        self.ImageView.image =[UIImage imageWithData:imageData];
    }];
    
//    self.ImageView.image = resImage;
//
//    NSData *Data = UIImagePNGRepresentation(image);
//    NSString *str =  [self length:Data.length];
//    NSLog(@"%@",str);
}


#pragma mark 计算  NSData 的大小
- (NSString*)length:(NSInteger)length{
    
    if (length > 1024 * 1024) {
        
        int mb = (int)length/(1024*1024);
        int kb = (length%(1024*1024))/1024;
        return [NSString stringWithFormat:@"%dMb%dKB",mb, kb];
    }else{
        
        return [NSString stringWithFormat:@"%ldKB",length/1024];
    }
    
}

@end
