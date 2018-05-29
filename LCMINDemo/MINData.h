//
//  MINData.h
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KMinIDKey    @"minID"
#define KSendtimekey      @"sendtime"
#define KAcceptTimeKey      @"acceptTime"
#define KCommentKey   @"comment"

@interface MINData : NSObject

@property (strong,nonatomic) NSString * minID;
@property (strong,nonatomic) NSString * sendtime;//服务器发送时间
@property (strong,nonatomic) NSString * timestamp;//云信发送时间
@property (strong,nonatomic) NSString * acceptTime;//接收时间
@property (strong,nonatomic) NSString * comment;

@end
