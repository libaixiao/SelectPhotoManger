//
//  NSObject+Runtime.h
//  RuntimeDemo
//  https://github.com/remember17/RuntimeDemo
//  Created by 程天效 on 2020/520.
//  Copyright © 2017年 wuhao. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Runtime)

/** 属性列表 */
- (NSArray *)propertiesInfo;

/** 属性列表 */
+ (NSArray *)propertiesInfo;

/** 格式化之后的属性列表 */
+ (NSArray *)propertiesWithCodeFormat;

/** 成员变量列表 */
- (NSArray *)ivarInfo;

/** 成员变量列表 */
+ (NSArray *)ivarInfo;

/** 对象方法列表 */
-(NSArray*)instanceMethodList;

/** 对象方法列表 */
+(NSArray*)instanceMethodList;

/** 类方法列表 */
+(NSArray*)classMethodList;

/** 协议列表 */
-(NSDictionary *)protocolList;

/** 协议列表 */
+(NSDictionary *)protocolList;

/** 交换实例方法 */
+ (void)SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;

/** 交换类方法 */
+ (void)SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;

/** 添加方法 */
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

@end
