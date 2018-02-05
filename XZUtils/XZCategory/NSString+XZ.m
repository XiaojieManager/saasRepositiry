//
//  NSString+XZ.m
//  HuPin
//
//  Created by 小赵  on 2017/8/16.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import "NSString+XZ.h"

#define PASSWD_MIN_LENGTH 6
#define PASSWD_MAX_LENGTH 18

@implementation NSString (XZ)
- (NSString *)vaildPassWord

{
    
    NSString *errMsg = nil;
    
    if (self == nil || self.length == 0) {
        
        errMsg = @"密码为空";
        
    } else if(self.length < PASSWD_MIN_LENGTH){
        
        errMsg = @"密码长度最少6位";
        
    }else if (self.length > PASSWD_MAX_LENGTH){
        errMsg = @"密码长度最多18位";
        
    }else if([self JudgeTheillegalCharacter]){
        
        errMsg = @"密码中不能包含非法字符";
        
    }
    
    return errMsg;
    
}

- (BOOL)JudgeTheillegalCharacter{
    
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    if (![emailTest evaluateWithObject:self]) {
        
        return YES;
        
    }
    
    return NO;
    
}
- (BOOL)isIphoneNumber{
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

//邮箱地址的正则表达式
- (BOOL)isValidateEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL) IsIdentityCard
{
    if (self.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

-(NSString *)getHHMMSSFromSS{
    
    NSInteger seconds = [self integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}
- (NSString *)getMMSSFromSS{
    NSInteger seconds = [self integerValue];
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    
    return format_time;

}

#pragma mark - 将某个时间戳转化成 时间

+ (NSString *)timestampSwitchTime:(long long)timestamp andFormatter:(NSString *)format{
    
    double time = timestamp;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"yyyy-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    
    return confromTimespStr;
    
}
- (NSString *)deleteSpace{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}
+ (NSString *)currentVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

}
+ (NSString *)appName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (BOOL)isPureNumber{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:[self deleteSpace]]) {//纯数字
        return YES;
    }
    return NO;
}

#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}


#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName
{
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}


#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

#pragma 正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber : (NSString *) number
{
    NSString *pattern = @"^[0-9]{12}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
    
}

#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url
{
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
}

+ (NSAttributedString *)formatPirceStyle:(NSString *)price color:(UIColor *)textColor tagFontNum:(CGFloat)tagFontNum maxFontNum:(CGFloat)maxFontNum minFontNum:(CGFloat)minFontNum{
    float priceNum = [price floatValue];
    NSString *tempPrice = [NSString stringWithFormat:@"￥%.2f",priceNum];
    NSRange pointRange = [tempPrice rangeOfString:@"."];
    
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:tempPrice];
    [attStr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, 1)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:tagFontNum] range:NSMakeRange(0, 1)];
    
    [attStr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(1, pointRange.location - 1)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:maxFontNum] range:NSMakeRange(1, pointRange.location - 1)];
    
    [attStr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(pointRange.location, tempPrice.length - pointRange.location)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:minFontNum] range:NSMakeRange(pointRange.location , tempPrice.length - pointRange.location )];
    
    return attStr;
}

@end
