
#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>

@interface APIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;


@end
