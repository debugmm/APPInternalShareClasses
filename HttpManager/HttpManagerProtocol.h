//
//  HttpManagerProtocol.h
//
//  Created by wjg on 31/10/2017.
//

#import <Foundation/Foundation.h>

@class LoginModel;

@protocol HttpManagerProtocol <NSObject>

@optional
#pragma mark - Login
-(void)loginFinished:(NSString *)statusMsg
          statusCode:(NSInteger)statusCode
       callbackParam:(id)callbackParam
           loginInfo:(LoginModel *)loginModel;

-(void)loginFailed:(NSString *)statusMsg
        statusCode:(NSInteger)statusCode
     callbackParam:(id)callbackParam;

@end
