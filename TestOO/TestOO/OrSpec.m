//
//  OrSpec.m
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "OrSpec.h"

@implementation OrSpec

+ (instancetype)spec:(ProductSpec *)spec, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start( args, spec );
    NSMutableArray *mArray = [@[spec] mutableCopy];
    for ( ;; )
    {
        id tempSpec = va_arg( args, id );
        if (tempSpec == nil)
            break;
        [mArray addObject:tempSpec];
    }
    va_end( args );
    OrSpec *andSpec = [[OrSpec alloc] init];
    andSpec.specs = [mArray copy];
    return andSpec;
}

- (BOOL)satisfy:(Product *)product
{
    for (ProductSpec *spec in _specs) {
        if ([spec satisfy:product]) {
            return YES;
        }
    }
    return NO;
}

@end
