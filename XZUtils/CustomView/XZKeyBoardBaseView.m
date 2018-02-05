//
//  XZKeyBoardBaseView.m
//  SAAS
//
//  Created by 赵肖杰 on 2017/12/15.
//  Copyright © 2017年 赵肖杰. All rights reserved.
//

#import "XZKeyBoardBaseView.h"
@interface XZKeyBoardBaseView ()
@property (nonatomic,assign) BOOL keyBoardIsOn;//调用多次

@end
@implementation XZKeyBoardBaseView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addNotification];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self addNotification];
    }
    return self;
}
- (void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取键盘的高度
        NSDictionary *userInfo = [notification userInfo];
        NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardRect = [value CGRectValue];
        CGFloat height = keyboardRect.size.height;
    if (!_keyBoardIsOn) {
        [self changeLayoutForShowKeyBoard:height];
    }
    _keyBoardIsOn = YES;
}

//当键退出
- (void)keyboardWillHide:(NSNotification *)notification
{
    _keyBoardIsOn = NO;
    [self changeLayoutForHideKeyBoard];
}

- (void)changeLayoutForHideKeyBoard{
    
}
- (void)changeLayoutForShowKeyBoard:(CGFloat)height{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
