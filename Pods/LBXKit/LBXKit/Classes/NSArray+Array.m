//
//  NSArray+Array.m
//  Kit
//  https://github.com/libaixiao/LBXKit.git
//  Created by 程天效 on 2020/57.
//   
//

#import "NSArray+Array.h"

@implementation NSArray (Array)

- (NSArray *)_reverseArray {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    return arrayTemp;
}

- (BOOL)IsArrEmpty{
    if (self == nil || [self isKindOfClass:[NSNull class]] || self.count == 0) {
        return YES;
    }
    return NO;
}

- (CGFloat) _maxNumberFromArray {
    CGFloat max = 0;
    max =[[self valueForKeyPath:@"@max.floatValue"] floatValue];
    return max;
}

- (CGFloat) _minNumberFromArray{
    CGFloat min = 0;
    min =[[self valueForKeyPath:@"@min.floatValue"] floatValue];
    return min;
}

- (CGFloat) _sumNumberFromArray{
    CGFloat sum = 0;
    sum = [[self valueForKeyPath:@"@sum.floatValue"] floatValue];
    return sum;
}

- (CGFloat) _averageNumberFromArray{
    CGFloat avg = 0;
    avg = [[self valueForKeyPath:@"@avg.floatValue"] floatValue];
    return avg;
}

@end
