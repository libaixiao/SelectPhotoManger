//
//  UITableView+TableView.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <UIKit/UIKit.h>

@interface UITableView (TableView)


- (void)updateWithBlock:(void (^)(UITableView *tableView))block;


- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;


- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


- (void)clearSelectedRowsAnimated:(BOOL)animated;

@end
