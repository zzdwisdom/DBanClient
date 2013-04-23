//
//  OnLine.h
//  GitDouBan
//
//  Created by ibokan on 13-4-16.
//  Copyright (c) 2013年 quyanhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnLine : NSObject
@property (nonatomic, retain) NSString *onlineTitle;
@property (nonatomic, retain) NSString *onlineId;
@property (nonatomic, retain) NSString *onlineURLString;
@property (nonatomic, retain) UIImage *onlineImage;
@property (nonatomic, retain) NSString *onlineDesc;
@property (nonatomic, retain) NSTimer *beginTime;
@property (nonatomic, retain) NSTimer *endTime;
@property (nonatomic, retain) NSString *onlineOwner;

@end
