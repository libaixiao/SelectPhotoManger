
//
//  Singleton.h
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on  2020/5/6.
//
//

#define SingletonH(ClassName) +(instancetype) share##ClassName;

#define SingletonM(ClassName) static id _instance;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
\
return _instance;\
}\
\
\
+(instancetype)share##ClassName\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc] init];\
});\
\
return _instance;\
}\
\
\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
\
- (id)mutableCopyWithZone:(nullable NSZone *)zone\
{\
return _instance;\
}
