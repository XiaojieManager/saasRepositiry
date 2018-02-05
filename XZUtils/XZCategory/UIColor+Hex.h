//
//  UIColor+Hex.h
//  HuPin
//
//  Created by 小赵  on 2017/7/13.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;
@end
