//
//  HttpManager.h
//
//  Created by wjg on 31/10/2017.
//

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject

/**
 @Description HTTP Manager 单例

 @return singleton
 */
+(HttpManager *)sharedManager;

/**
 @Description 设置based urlString

 @param basedURLString basedURLString
 */
-(void)configBasedURLString:(NSString *)basedURLString;

#pragma mark - Sender Request

/**
 @Description 发送登陆请求

 @param sender 发送者
 @param param 参数
 @param callbackParam 回调可能会用到的数据
 */
-(void)sendLoginHttpRequest:(id)sender
               requestParam:(NSDictionary *)param
              callbackParam:(id)callbackParam;

@end
