//
//  activeViewController.m
//  DBanClient
//
//  Created by ibokan on 13-4-17.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "activeViewController.h"
#import "OnLine.h"
#import "JSON.h"

@interface activeViewController ()

@property (nonatomic, retain) OnLine *online;
@property (nonatomic, retain) NSMutableArray *onlines;
@property (nonatomic, retain)NSMutableData *responseData;

@end

@implementation activeViewController

-(void)dealloc
{
    [_online release];
    [_onlines release];
    [_responseData release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.onlines count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"OnlineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
    }
    OnLine *online = [self.onlines objectAtIndex:indexPath.row];
    cell.textLabel.text = online.onlineTitle;
    cell.detailTextLabel.text = online.onlineDesc;
    cell.detailTextLabel.numberOfLines = 3;
    cell.imageView.image = online.onlineImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
