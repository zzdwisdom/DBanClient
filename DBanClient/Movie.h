//
//  movie.h
//  DBanClient
//
//  Created by ibokan on 13-4-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface movie : NSObject
@property(nonatomic,retain)NSString *movieID;
@property(nonatomic,retain)NSString *movieName;
@property (nonatomic, retain) NSString *thumbnailURLString;
@property (nonatomic, retain) UIImage *thumbnail;
@end
