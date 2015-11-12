//
//  ColorSpec.m
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "ColorSpec.h"
#import "Product.h"

@implementation ColorSpec

+ (instancetype)specWithColor:(UIColor *)color
{
    ColorSpec *spec = [[ColorSpec alloc] init];
    spec.color = color;
    return spec;
}
- (BOOL)satisfy:(Product *)product
{
    return product.color == [UIColor redColor];
}

@end
