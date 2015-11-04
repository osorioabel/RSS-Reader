

#import "Articule.h"
#import "ApiClient.h"

@implementation Articule


- (instancetype)initWithAttributes:(NSDictionary *)attributes{

    self.title = (NSString*)[attributes objectForKey:@"title"];
    self.detail = (NSString*)[attributes objectForKey:@"description"];
    self.url = [attributes objectForKey:@"link"];
    self.guid = [attributes objectForKey:@"guid"];
    self.publication_date = [attributes objectForKey:@"pubDate"];
    return self;
}

+ (NSURLSessionDataTask *)getPlaystationRSS:(void (^)(id response, NSError *error))block{
    
    NSString *url=@"playstation/Games_PS3.rss";
    return [[APIClient sharedClient] GET:url parameters:nil success:^(NSURLSessionDataTask * __unused task, id responseObject ) {
        
        if (block) {
                block(responseObject, nil);
            }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];



}
+ (NSURLSessionDataTask *)getXboxRSS:(void (^)(id response, NSError *error))block{
    
    NSString *url=@"playstation/Games_PS3.rss";
    return [[APIClient sharedClient] GET:url parameters:nil success:^(NSURLSessionDataTask * __unused task, id responseObject ) {
        
        if (block) {
            block(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}







@end
