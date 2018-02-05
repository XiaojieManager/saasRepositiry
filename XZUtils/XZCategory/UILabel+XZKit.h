//
//  UILabel+XZKit.h
//  HuPin
//
//  Created by 小赵  on 2017/7/18.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XZKit)
+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font;
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;
@end
