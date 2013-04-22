//
//  movie.m
//  DBanClient
//
//  Created by ibokan on 13-4-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "movie.h"

@implementation movie
-(void)dealloc
{
    [_movieID release];
    [_movieName release];
    
    [_thumbnail release];
    [_thumbnailURLString release];
    [super dealloc];
    
    
}@end
