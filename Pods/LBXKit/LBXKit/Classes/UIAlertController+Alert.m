//
//  UIAlertController+Alert.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2017/7/7.
//   
//  

#import "UIAlertController+Alert.h"

@implementation UIAlertController (Alert)

+ (UIAlertController *)_alertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock{
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancel];
        [alert addAction:OK];
    }
    return alert;
}


+ (UIAlertController *)_sheetAlertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancel];
        [alert addAction:OK];
    }
    return alert;
}

@end
