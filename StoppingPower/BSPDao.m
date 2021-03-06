#import "BSPDao.h"

@interface BSPDao()
@property (nonatomic) NSOperationQueue *queue;
@property (nonatomic, readwrite) NSString *endpoint;
@end

@implementation BSPDao

-(id)init {
    if (self = [super init]) {
        self.endpoint = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BSPWebEndpoint"];
        self.queue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

-(void)retrieveStudies:(void (^)(NSURLResponse*, NSData*, NSError*)) handler {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", self.endpoint, @"app.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.queue completionHandler:handler];
}

-(void)publishResult:(BSPResult*)result handler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", self.endpoint, @"app/result.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:result.jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.queue completionHandler:handler];
}

@end
