//
//  ProductSpec.h
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface ProductSpec : NSObject

- (BOOL)satisfy:(Product *)product;

@end
