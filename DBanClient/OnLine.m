//
//  OnLine.m
//  GitDouBan
//
//  Created by ibokan on 13-4-16.
//  Copyright (c) 2013年 quyanhui. All rights reserved.
//

#import "OnLine.h"

@implementation OnLine
-(void)dealloc
{
    [_onlineId release];
    [_onlineImage release];
    [_onlineURLString release];
    [_onlineTitle release];
    [_onlineDesc release];
    [_beginTime release];
    [_endTime release];
    [_onlineOwner release];
    [super dealloc];
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"ID:%@  Title:%@",_onlineId,_onlineTitle];
}
@end
