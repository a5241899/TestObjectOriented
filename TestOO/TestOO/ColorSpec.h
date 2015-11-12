//
//  ColorSpec.h
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "ProductSpec.h"
#import <UIKit/UIKit.h>

@interface ColorSpec : ProductSpec

@property (nonatomic, strong) UIColor *color;

+ (instancetype)specWithColor:(UIColor *)color;

@end
