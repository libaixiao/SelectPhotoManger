//
//  Foundation+Safe.h
//  KitDemo
//
//  Created by 程天效 on 2018/6/12.
//  Copyright © 2018年 remember17. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<__covariant ObjectType> (Safe)

- (nullable ObjectType)safeObjectAtIndex:(NSUInteger)index;

- (nullable ObjectType)safeObjectAtIndex:(NSUInteger)index defaultValue:(nullable ObjectType)defaultValue;

+ (instancetype _Nullable )safeArrayWithObject:(ObjectType _Nullable )object;

- (nullable NSArray<ObjectType> *)safeSubarrayWithRange:(NSRange)range;

- (NSUInteger)safeIndexOfObject:(ObjectType _Nullable )anObject;

- (NSUInteger)safeIndexOfObject:(ObjectType _Nullable )anObject defaultIndex:(NSUInteger)defaultIndex;

@end

@interface NSMutableArray<ObjectType> (Safe)

- (void)safeAddObject:(ObjectType _Nullable )object;

- (void)safeInsertObject:(ObjectType _Nullable )object atIndex:(NSUInteger)index;

- (void)safeInsertObjects:(NSArray<ObjectType> *_Nullable)objects atIndexes:(NSIndexSet *_Nullable)indexs;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)safeRemoveObjectsInRange:(NSRange)range;

- (nullable ObjectType)safeObjectAtIndexedSubscript:(NSUInteger)index;

@end

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (Safe)

+ (instancetype)safeDictionaryWithObject:(ObjectType _Nullable )object forKey:(KeyType)key;

@end

@interface NSMutableDictionary<KeyType, ObjectType> (safe)

- (void)safeSetObject:(ObjectType)aObj forKey:(KeyType)aKey;

@end

@interface NSString (Safe)

- (nullable NSString *)safeSubstringFromIndex:(NSUInteger)from;

- (nullable NSString *)safeSubstringToIndex:(NSUInteger)to;

- (nullable NSString *)safeSubstringWithRange:(NSRange)range;

- (NSRange)safeRangeOfString:(nullable NSString *)aString;

- (NSRange)safeRangeOfString:(nullable NSString *)aString options:(NSStringCompareOptions)mask;

- (NSString *)safeStringByAppendingString:(NSString *)aString;

- (instancetype)safeInitWithString:(NSString *)aString;

+ (instancetype)safeStringWithString:(NSString *)string;

@end

@interface NSMutableString (Safe)

- (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;

- (void)safeAppendString:(NSString *)aString;

@end
