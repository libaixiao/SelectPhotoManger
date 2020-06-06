//
//  UIScrollView+ScrollView.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UIScrollView (ScrollView)

- (void)scrollToTop;

- (void)scrollToBottom;

- (void)scrollToLeft;

- (void)scrollToRight;

- (void)scrollToTopAnimated:(BOOL)animated;

- (void)scrollToBottomAnimated:(BOOL)animated;

- (void)scrollToLeftAnimated:(BOOL)animated;

- (void)scrollToRightAnimated:(BOOL)animated;

@end
