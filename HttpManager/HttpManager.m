//
//  HttpManager.m
//
//  Created by wjg on 31/10/2017.
//

#import "HttpManager.h"
#import "HttpManagerHeader.h"

#define CallBackParam (@"callBackParam")
#define Sender (@"sender")

static HttpManager *sharedManager;

@interface HttpManager()

@property(nonatomic,copy)NSString *basedURLString;

@end

@implementation HttpManager

+(HttpManager *)sharedManager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedManager=[[HttpManager alloc] init];
    });
    
    return sharedManager;
}

-(void)configBasedURLString:(NSString *)basedURLString{

    self.basedURLString=basedURLString;//scheme://host:port
}

-(void)configRequest:(ASIFormDataRequest *)rq
              sender:(id)sender
               param:(NSDictionary *)param
       callbackParam:(id)callbackParam{
    
//     [rq setUseCookiePersistence:NO];
//     [rq setUseSessionPersistence:NO];
    [rq setTimeOutSeconds:5];
//     [rq setValidatesSecureCertificate:NO];
    
    if(param && [param isKindOfClass:[NSDictionary class]]){
        
        [param enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            [rq addPostValue:obj forKey:key];
        }];
    }
    
    NSMutableDictionary *userInfo=[NSMutableDictionary dictionaryWithCapacity:2];
    if(sender){
        
        [userInfo setObject:sender forKey:Sender];
    }
    if(callbackParam){
        
        [userInfo setObject:callbackParam forKey:CallBackParam];
    }
    
    rq.userInfo=userInfo;
    
    rq.delegate=self;
    
    [[ASIHTTPRequest sharedQueue] addOperation:rq];
}

#pragma mark - Send HTTP Request Methods
-(void)sendLoginHttpRequest:(id)sender
               requestParam:(NSDictionary *)param
              callbackParam:(id)callbackParam{
    
//    NSURL *url=[self buildURLWithURLPath:UserLogin_PostAPIPath_V2];
//    
//    ASIFormDataRequest *rq=[ASIFormDataRequest requestWithURL:url];
//    
//    [rq setRequestMethod:@"POST"];
    
    [rq setDidFailSelector:@selector(loginRequestFailed:)];
    [rq setDidFinishSelector:@selector(loginRequestFinished:)];
    
//    [self configRequest:rq sender:sender param:param callbackParam:(id)callbackParam];
}

#pragma mark - request call back
//all request call back methods runing main thread,you may want to optimize,etc use dispatch_async()

-(void)loginRequestFinished:(ASIFormDataRequest *)rq{

    id obj=[rq.userInfo objectForKey:CallBackParam];
    id sender=[rq.userInfo objectForKey:Sender];
    
    //生成model数据，比如此处应该生成LoginModel数据，并向sender发送消息。
    
    //判断sender是否符合相关协议，并进一步判断是否实现指定协议方法，进而发送消息。
    if(sender && [sender conformsToProtocol:@protocol(HttpManagerProtocol)]){
        
        if([sender respondsToSelector:@selector(loginFinished:statusCode:callbackParam:loginInfo:)]){
            
            //发送消息
        }
    }
}

-(void)loginRequestFailed:(ASIFormDataRequest *)rq{

    id obj=[rq.userInfo objectForKey:CallBackParam];
    id sender=[rq.userInfo objectForKey:Sender];
    
    if(sender && [sender conformsToProtocol:@protocol(HttpManagerProtocol)]){
        
        if([sender respondsToSelector:@selector(loginFailed:statusCode:callbackParam:)]){
            
            //发送消息
        }
    }
}

@end
