//
//  BelowWeightSpec.m
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "BelowWeightSpec.h"
#import "Product.h"

@implementation BelowWeightSpec

+ (instancetype)specWithBelowWeight:(float)limit
{
    BelowWeightSpec *spec = [[BelowWeightSpec alloc] init];
    spec.limit = limit;
    return spec;
}
- (BOOL)satisfy:(Product *)product
{
    return (product.weight > _limit);
}

@end
