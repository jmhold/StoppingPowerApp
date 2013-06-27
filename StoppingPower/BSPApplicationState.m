#import "BSPApplicationState.h"

@interface BSPApplicationState()
@property (nonatomic, readwrite) BSPDao *dao;
@property (nonatomic, readwrite) BSPResultSync *resultSync;
@property (nonatomic, readwrite) BSPDatabase *database;
@end

@implementation BSPApplicationState
-(id)init {
    if(self = [super init]) {
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"db.sqlite"];
        
        self.dao = [[BSPDao alloc] init];
        self.database = [[BSPDatabase alloc] initWithDatabasePath:dbPath];
        self.resultSync = [[BSPResultSync alloc] initWithDao:self.dao database:self.database];
    }
    return self;
}
@end
