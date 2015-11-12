//
//  NotSpec.m
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "NotSpec.h"

@interface NotSpec ()
@property (nonatomic, strong) ProductSpec *spec;
@end

@implementation NotSpec

+ (instancetype)spec:(ProductSpec *)spec
{
    NotSpec *notSpec = [[NotSpec alloc] init];
    notSpec.spec = spec;
    return notSpec;
}

- (BOOL)satisfy:(Product *)product
{
    if (![_spec satisfy:product]) {
        return YES;
    }
    return NO;
}

@end
