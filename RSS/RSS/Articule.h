

#import <Foundation/Foundation.h>

@interface Articule : NSObject



@property (nonatomic, assign) NSString   *url;
@property (nonatomic, strong) NSString   *title;
@property (nonatomic, strong) NSString   *detail;
@property (nonatomic, strong) NSString   *guid;
@property (nonatomic, strong) NSString   *publication_date;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
+ (NSURLSessionDataTask *)getPlaystationRSS:(void (^)(id response, NSError *error))block;
+ (NSURLSessionDataTask *)getXboxRSS:(void (^)(id response, NSError *error))block;




@end
