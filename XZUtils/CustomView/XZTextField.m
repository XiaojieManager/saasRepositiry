//
//  XZTextField.m
//  SAAS
//
//  Created by 赵肖杰 on 2017/12/27.
//  Copyright © 2017年 赵肖杰. All rights reserved.
//

#import "XZTextField.h"

@implementation XZTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customConfig];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customConfig];
    }
    return self;
}
- (void)customConfig{
    self.delegate = self;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    if (self.inputType == TextFieldInputTypeForPositiveNumber) {
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
            return NO;
        }
    }
    if (self.inputType == TextFieldInputTypeForNumber) {
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789.\b"];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
            return NO;
        }
    }
    if (self.inputType == TextFieldInputTypeForNoZeroPositiveNumber) {
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"123456789\b"];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
            return NO;
        }
    }
    if (self.inputType == TextFieldInputTypeForNumberAndCharAndSymbol) {
        NSUInteger lengthOfString = string.length;  //lengthOfString的值始终为1
        for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++) {
            unichar character = [string characterAtIndex:loopIndex]; //将输入的值转化为ASCII值（即内部索引值），可以参考ASCII表
            if (character < 33) { return NO;}
            if( character > 0x4e00 && character < 0x9fff){return NO;}//判断输入的是否是中文
        }
//            // 48-57;{0,9};65-90;{A..Z};97-122:{a..z}
//            if (character < 48) return NO; // 48 unichar for 0
//            if (character > 57 && character < 65) return NO; //
//            if (character > 90 && character < 97) return NO;
//            if (character > 122) return NO;
            
    }
    
    if (self.maxLength != 0) {
        NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
        if (proposedNewLength > self.maxLength) {
            return NO;//限制长度
        }
    }
    if (self.maxValue) {
        CGFloat tempFloat = [[NSString stringWithFormat:@"%@%@",textField.text,string] floatValue];
        if (tempFloat > [self.maxValue integerValue]) {
            
            textField.text = [NSString stringWithFormat:@"%@",self.maxValue];
            return NO;
        }
    }

    if ([string isEqualToString:@""]) {
        return YES;
    }
   
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
