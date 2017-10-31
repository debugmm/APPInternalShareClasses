//
//  NSString+CateString.m
//
//  Created by wjg on 31/10/2017.
//

#import "NSString+CateString.h"

@implementation NSString (CateString)
#pragma mark - Material Class Methods
+(BOOL)isEmptyString:(NSString *)string{
    
    if(string &&
       [string isKindOfClass:[NSString class]] &&
       string.length>0){

        return NO;
        
    }else{
        
        return YES;
    }
}

+(NSString *)stringByTrimmingBothEndWhiteSpace:(NSString *)string{
    
    if([NSString isEmptyString:string]){
        
        //最好不要使用nil，因为这改变了类型，会引起bug。
        //此处采用NSString初始化返回值（一个空字符串），相当于类型转换（将可能的任何其他类型转换为字符串类型）。
        return [[NSString alloc] init];
        
    }else{
        
        return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
}

#pragma mark - is Email
+(BOOL)isLegalEmail:(NSString *)email{
    
    if([NSString isEmptyString:[NSString stringByTrimmingBothEndWhiteSpace:email]]){
        
        return NO;//判空
    }
    
    NSString *nomalRegEx=@"[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}";
    NSPredicate *normalPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",nomalRegEx];
    
    BOOL result=[normalPredicate evaluateWithObject:email];
    
    if(!result){
        /**
         *  @abstract   扩展支持中英混合的Email
         *  @discussion 添加此支持，为了符合中文email
         */
        NSString *extendRegEx=@"([A-Z0-9a-z._-]|[\u4e00-\u9fa5])+@([A-Za-z0-9.-]|[\u4e00-\u9fa5])+\\.([A-Za-z0-9]|[\u4e00-\u9fa5])+";//[\u4e00-\u9fa5]
        
        NSPredicate *extendPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",extendRegEx];
        result=[extendPredicate evaluateWithObject:email];
    }
    
    return result;
}

#pragma mark - Convert Date To String
+(NSString *)convertDateToDateTimeString:(NSDate *)date{
    
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //
    NSString *dateString=[dateFormat stringFromDate:date];
    
    return dateString;
}

#pragma mark - judge is Decimal String
+(BOOL)isDecimalDigitString:(NSString *)string{
    
    NSString *midString=[NSString stringByTrimmingBothEndWhiteSpace:string];
    BOOL isDecimalDigitString=NO;
    
    if(![NSString isEmptyString:midString] &&
       [midString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]].length<=0){
        
        isDecimalDigitString=YES;
    }
    
    return isDecimalDigitString;
}

@end
