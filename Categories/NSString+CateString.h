//
//  NSString+CateString.h
//
//  Created by wjg on 31/10/2017.
//

#import <Foundation/Foundation.h>

@interface NSString (CateString)
#pragma mark - Material Class Methods
/**
 *  @abstract judgment string whether content.length==0/nil/NULL or not.
 *
 *  @param string type:NSString.
 *
 *  @return BOOL(YES,content is empty).
 */
+(BOOL)isEmptyString:(NSString *)string;

/**
 *  @abstract delete string both end white space.
 *
 *  @param string type:NSString.
 *
 *  @return new string that deleted both end white space.
 */
+(NSString *)stringByTrimmingBothEndWhiteSpace:(NSString *)string;

#pragma mark - is Email
/**
 @Description 是否是符合Email格式的合法email地址

 @param email emailString
 @return YES OR NO
 */
+(BOOL)isLegalEmail:(NSString *)email;

#pragma mark - Convert Date To String
/**
 @Description 转换日期类型为：日期时间字符串
 
 @param date date 待转换的日期
 @return return value 日期时间字符串
 */
+(NSString *)convertDateToDateTimeString:(NSDate *)date;

#pragma mark - judge is Decimal String
/**
 @Description 是否是纯数字字符串
 
 @param string 字符串
 @return YES or NO
 */
+(BOOL)isDecimalDigitString:(NSString *)string;

@end
