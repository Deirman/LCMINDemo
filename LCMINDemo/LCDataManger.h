//
//  LCDataManger.h
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCDataManger : NSObject
+(NSMutableArray *) readListFromFile:(NSString *) fileName;//读的函数
+(void)writeList:(NSMutableArray *) list To:(NSString *) fileName;//写的函数
+(NSString*)dataFilepath;

+ (NSString *)getOperationLogFileForFileName:(NSString*)fileName;
+ (void)WriteLogToFile:(NSString *)log  withFileName:(NSString*)fileName;
+ (void)deleteFileForFileName:(NSString*)fileName;

@end
