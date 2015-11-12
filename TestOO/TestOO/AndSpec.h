//
//  AndSpec.h
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "ProductSpec.h"

@interface AndSpec : ProductSpec

@property (nonatomic, strong) NSArray *specs;

+ (instancetype)spec:(ProductSpec *)spec, ... NS_REQUIRES_NIL_TERMINATION;

@end
