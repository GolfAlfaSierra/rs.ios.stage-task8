//
//  NSArray+Shuffle.m
//  RSSchool_T8
//
//  Created by John Kent on 20.07.2021.
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)
-(void)shuffle{
    NSUInteger count = [self count];
    if (count <= 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        
        
        
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}
@end
