//
//  NSDictionary+Dictionary.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <Foundation/Foundation.h>

@interface NSDictionary (Dictionary)

/** 一般模型属性 */
-(void)_createProperty;

/** 网络模型属性 */
-(void)_createNetProperty;

/** 合并两个NSDictionary */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;

/** 并入一个NSDictionary */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

/** 拼接字典 */
- (NSDictionary *)dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;

/** 删除某些key值 */
- (NSDictionary *)dictionaryByRemovingEntriesWithKeys:(NSSet *)keys;

@end
