//
//  NSNumber+XZ.m
//  SAAS
//
//  Created by 赵肖杰 on 2017/12/28.
//  Copyright © 2017年 赵肖杰. All rights reserved.
//

#import "NSNumber+XZ.h"

@implementation NSNumber (XZ)

- (NSString *)formatterPointNumber:(NSUInteger )number{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setMaximumFractionDigits:number];
    [numberFormatter setMinimumFractionDigits:number];
    return [numberFormatter stringFromNumber:self];
}
@end
