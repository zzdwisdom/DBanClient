//
//  activeViewController2.m
//  DBanClient
//
//  Created by 徐 杨 on 13-4-23.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "activeViewController2.h"
#import "OnLine.h"
#import "JSON.h"
#import "activeViewController.h"

@interface activeViewController2 ()

@property (nonatomic, retain) OnLine *online;
@property (nonatomic, retain) NSMutableArray *onlines;
@property (nonatomic, retain) NSMutableData *responseData;

@end

@implementation activeViewController2

-(void)dealloc
{
    [_online release];
    [_onlines release];
    [_responseData release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/onlines?apikey=02e4906e7a194c5008adb14b6e4be4f0"]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseData = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSString *responseString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSDictionary *xmlDic = [responseString JSONValue];
    NSLog(@"aaa%@",xmlDic);
    NSMutableArray *onlines = [NSMutableArray array];
    NSArray *onlineList = [xmlDic objectForKey:@"onlines"];
    
    for (NSDictionary *dic in onlineList)
    {
        OnLine *online = [[[OnLine alloc] init] autorelease];
        online.onlineTitle = [dic objectForKey:@"title"];
        online.onlineId = [dic objectForKey:@"album_id"];
        online.onlineDesc = [dic objectForKey:@"desc"];
        online.onlineURLString= [dic objectForKey:@"cover"];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:online.onlineURLString]];
        online.onlineImage = [UIImage imageWithData:imageData];
        
        self.onlines = onlines;
        [self.onlines addObject:online];
        NSLog(@"%@",online);
    }
    
    [responseString release];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        static NSString *identifier = @"OnlineCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        }
        OnLine *online = [self.onlines objectAtIndex:indexPath.row];
        cell.textLabel.text = online.onlineTitle;
        cell.imageView.image = online.onlineImage;
    }
    else
    {
        static NSString *identifier = @"OnlineCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        }
        OnLine *online = [self.onlines objectAtIndex:indexPath.row];
        cell.textLabel.text = online.onlineDesc;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100.0;
    }
    else
    {
        return 300.0;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"活动:";
    }
    else
    {
        return @"活动信息:";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end



















