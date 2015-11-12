//
//  ViewController.m
//  TestOO
//
//  Created by bingjun on 15/11/11.
//  Copyright © 2015年 Heshuai. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductSpec.h"
#import "ColorSpec.h"
#import "BelowWeightSpec.h"
#import "AndSpec.h"
#import "OrSpec.h"
#import "NotSpec.h"

@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *products;

@end

@implementation ViewController

static ProductSpec *COLOR(UIColor *color)
{
    return [ColorSpec specWithColor:[UIColor redColor]];
}
static ProductSpec *BELOWWEIGHT(float limit)
{
    return [BelowWeightSpec specWithBelowWeight:limit];
}
static ProductSpec *AND(ProductSpec *spec1, ProductSpec *spec2)
{
    return [AndSpec spec:spec1, spec2, nil];
}
static ProductSpec *OR(ProductSpec *spec1, ProductSpec *spec2)
{
    return [OrSpec spec:spec1, spec2, nil];
}
static ProductSpec *NOT(ProductSpec *spec)
{
    return [NotSpec spec:spec];
}

typedef BOOL(^ProductSpecBlock)();
ProductSpecBlock color(UIColor *color)
{
    return ^BOOL(id p) {
        return [p color] == color;
    };
}

ProductSpecBlock weightBelow(float limit)
{
    return ^BOOL(id p) {return [p weight] < limit;};
}

- (void)test7_2
{
    [self findProducts:_products byBlock:color([UIColor redColor])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.products = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        Product *product = [[Product alloc] init];
        if (i % 5) {
            product.color = [UIColor greenColor];
        }else {
            product.color = [UIColor redColor];
        }
        product.weight = i;
        
        [self.products addObject:product];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    
//    NSArray *filteArray = [self findAllRedProducts:_products];
    
//    NSArray *filteArray = [self findProducts:_products bySpec:[ColorSpec specWithColor:[UIColor redColor]]];
//    NSArray *filteArray = [self findProducts:_products bySpec:[BelowWeightSpec specWithBelowWeight:15]];
//    NSArray *filteArray = [self findProducts:_products bySpec:[AndSpec spec:[ColorSpec specWithColor:[UIColor redColor]],[BelowWeightSpec specWithBelowWeight:10], nil]];
//    NSArray *filteArray = [self findProducts:_products bySpec:NOT(AND(COLOR([UIColor redColor]), BELOWWEIGHT(10)))];
//    NSArray *filteArray = [self findProducts:_products byBlock:^BOOL(id p) {
//        return [p color] == [UIColor redColor];
//    }];
    NSArray *filteArray = [self.products filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"color = %@",[UIColor redColor]]];
    for (Product *product in filteArray) {
        NSLog(@"=---------:%f",product.weight);
    }
    NSLog(@"=---------:%@",filteArray);
}

- (NSArray *)findProducts:(NSArray *)products byBlock:(BOOL (^)())block
{
    NSMutableArray *list = [@[] mutableCopy];
    for (Product *product in products) {
        if (block(product)) {
            [list addObject:product];
        }
    }
    return list;
}

- (NSArray *)findAllRedProducts:(NSArray *)products
{
    NSMutableArray *list = [@[] mutableCopy];
    for (Product *product in products) {
        if (product.color == [UIColor redColor]) {
            [list addObject:product];
        }
    }
    return list;
}

- (NSArray *)findProducts:(NSArray *)products bySpec:(ProductSpec *)spec
{
    NSMutableArray *list = [@[] mutableCopy];
    for (Product *product in products) {
        if ([spec satisfy:product]) {
            [list addObject:product];
        }
    }
    return list;
}

@end
