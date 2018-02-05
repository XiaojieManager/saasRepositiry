//
//  UILabel+XZKit.m
//  HuPin
//
//  Created by 小赵  on 2017/7/18.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import "UILabel+XZKit.h"

@implementation UILabel (XZKit)
+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    if (textColor) {
        label.textColor = textColor;
    }
    if (font) {
        label.font = font;
    }
    return label;
}
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

@end
