//
//  UIButton+XZKit.h
//  HuPin
//
//  Created by 小赵  on 2017/7/18.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (XZKit)

+ (instancetype)buttonWithWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image target:(id)target action:(SEL)action;

+ (instancetype)buttonLoginBlackStyleWithTitle:(NSString *)title;

- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
