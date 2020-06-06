//
//  NSFileManager+FileManager.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//  

#import <Foundation/Foundation.h>

@interface NSFileManager (FileManager)

/** document URL */
+ (NSURL *)documentsURL;

/** document 路径 */
+ (NSString *)documentsPath;

/** library URL */
+ (NSURL *)libraryURL;

/** library 路径 */
+ (NSString *)libraryPath;

/** cache URL */
+ (NSURL *)cachesURL;

/** cache 路径 */
+ (NSString *)cachesPath;

@end
