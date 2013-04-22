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
    [_onlineString release];
    [_onlineTitle release];
    [_onlineDesc release];
    [_beginTime release];
    [_endTime release];
    [super dealloc];
    
    
}

@end
