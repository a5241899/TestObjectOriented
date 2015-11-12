//
//  BelowWeightSpec.h
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "ProductSpec.h"

@interface BelowWeightSpec : ProductSpec

@property (nonatomic, assign) float limit;

+ (instancetype)specWithBelowWeight:(float)limit;

@end
