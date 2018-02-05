//
//  NSString+XZ.h
//  HuPin
//
//  Created by 小赵  on 2017/8/16.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (XZ)
- (NSString *)vaildPassWord;
- (BOOL)JudgeTheillegalCharacter;
- (BOOL)isIphoneNumber;

///邮箱地址的正则表达式
- (BOOL)isValidateEmail;

- (BOOL) IsIdentityCard;


//传入 秒  得到 xx:xx:xx

-(NSString *)getHHMMSSFromSS;

- (NSString *)getMMSSFromSS;

//将某个时间戳转化成 时间
//timestamp 时间戳(单位秒) format 时间格式 ps. @"yyyy-MM-dd hh:mm:ss"
+ (NSString *)timestampSwitchTime:(long long)timestamp andFormatter:(NSString *)format;

- (NSString *)deleteSpace;

+ (NSString *)currentVersion;
+ (NSString *)appName;

- (BOOL)isPureNumber;



// 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
// 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
// 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
// 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
// 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;


///价钱样子
+ (NSAttributedString *)formatPirceStyle:(NSString *)price color:(UIColor *)textColor tagFontNum:(CGFloat)tagFontNum maxFontNum:(CGFloat)maxFontNum minFontNum:(CGFloat)minFontNum;
@end
