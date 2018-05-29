//
//  MINData.m
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "MINData.h"

@implementation MINData

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.minID forKey:KMinIDKey];
    [encoder encodeObject:self.sendtime forKey:KSendtimekey];
    [encoder encodeObject:self.acceptTime forKey:KAcceptTimeKey];
    [encoder encodeObject:self.comment forKey:KCommentKey];
}
-(id)initWithCoder:(NSCoder *)decoder
{
    if (self=[super init]) {
        self.minID=[decoder decodeObjectForKey:KMinIDKey];
        self.sendtime=[decoder decodeObjectForKey:KSendtimekey];
        self.acceptTime=[decoder decodeObjectForKey:KAcceptTimeKey];
        self.comment=[decoder decodeObjectForKey:KCommentKey];
    }
    return self;
}

@end
