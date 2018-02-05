//
//  XZTextField.h
//  SAAS
//
//  Created by 赵肖杰 on 2017/12/27.
//  Copyright © 2017年 赵肖杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,TextFieldInputType) {
    TextFieldInputTypeForNormal,
    TextFieldInputTypeForNoZeroPositiveNumber,//123456789
    TextFieldInputTypeForPositiveNumber,//0123456789
    TextFieldInputTypeForNumber,//0123456789.
    TextFieldInputTypeForNumberAndCharAndSymbol
};
@interface XZTextField : UITextField<UITextFieldDelegate>
@property (nonatomic,assign) TextFieldInputType inputType;
@property (nonatomic,assign) NSInteger maxLength;
@property (nonatomic,copy) NSString *maxValue;//最大的数值

@end
