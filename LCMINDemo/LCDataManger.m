//
//  LCDataManger.m
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCDataManger.h"

#define KFilenme    @"aehive"
#define KDataKey    @"Data"

@implementation LCDataManger

+(void)writeList:(NSMutableArray *) list To:(NSString *) fileName//写的函数
{
    NSMutableData*data=[[NSMutableData alloc]init];//声明一个可变数据类型
    NSKeyedArchiver*archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];//编码
    [archiver encodeObject:list forKey:KDataKey];//存放数据文件的类型和名字
    [archiver finishEncoding];//编码完成
    [data writeToFile:[LCDataManger dataFilepath] atomically:YES];//写在相应的路径下
}
+(NSMutableArray *) readListFromFile:(NSString *) fileName//读的函数
{
    if ([[NSFileManager defaultManager]fileExistsAtPath:fileName])//是否存在要读的数据类型，如果存在
    {
        NSData*data=[[NSMutableData alloc]initWithContentsOfFile:fileName];//打开名为fileName数据类型的数据
        NSKeyedUnarchiver*unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];//解码
        NSMutableArray * array = [unarchiver decodeObjectForKey:KDataKey];//把解码出来的数据存放在可变数组里面
        [unarchiver finishDecoding];//解码完成
        if (!array) {
            array=[[NSMutableArray alloc]init];
        }
        return array;//返回该数组
    }

    return [[NSMutableArray alloc]init];;//如果不存在名为fileName数据类型直接返回空
}


+(NSString*)dataFilepath
{
    NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString*documentDirectory=[paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:KFilenme];
}



+ (void)WriteLogToFile:(NSString *)log  withFileName:(NSString*)fileName
{

    NSString *directory = [self getOperationLogPath];

    NSString *filepath = [directory stringByAppendingString:[NSString stringWithFormat:@"/%@.txt",fileName]];

    NSFileManager *defaultManager = [NSFileManager defaultManager];

    if (![defaultManager fileExistsAtPath:filepath]) {

        [defaultManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil];

        [defaultManager createFileAtPath:filepath contents:nil attributes:nil];

    }

    NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:filepath];

    [handle seekToEndOfFile];

    [handle writeData:[[log stringByAppendingString:@"\n"] dataUsingEncoding:NSUTF8StringEncoding]];

    [handle closeFile];

}

+ (NSString *)getOperationLogFileForFileName:(NSString*)fileName{

    NSString *directory = [self getOperationLogPath];

    NSString *filePath = [directory stringByAppendingString:[NSString stringWithFormat:@"/%@.txt",fileName]];

    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];

    [handle seekToFileOffset:0];

    NSData *data = [handle readDataToEndOfFile];

    [handle closeFile];

    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSString *)getOperationLogPath{

    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *directory = [libraryDirectory stringByAppendingString:@"/MINData"];
    return directory;
}

/**
 删除文件
 */
+ (void)deleteFileForFileName:(NSString*)fileName{
    NSString *directory = [self getOperationLogPath];

    NSString *filePath = [directory stringByAppendingString:[NSString stringWithFormat:@"/%@.txt",fileName]];

    NSFileManager *defaultManager = [NSFileManager defaultManager];

    if ([defaultManager fileExistsAtPath:filePath]) {
        [defaultManager removeItemAtPath:filePath error:nil];
    }
}





@end
