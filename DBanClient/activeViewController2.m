//
//  activeViewController2.m
//  DBanClient
//
//  Created by 徐 杨 on 13-4-23.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "activeViewController2.h"
#import "JSON.h"
#import "OnLine.h"
#import "activeViewController.h"

@interface activeViewController2 ()

@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSMutableArray *onlines;
@property (nonatomic, retain) OnLine *online;
@property(nonatomic,retain)UILabel *label1;
@property(nonatomic,retain)UILabel *restlabel;
@property(nonatomic,retain)UILabel *restlabel2;

@end

@implementation activeViewController2

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/onlines?apikey=02e4906e7a194c5008adb14b6e4be4f0"]];
//    
//    [NSURLConnection connectionWithRequest:request delegate:self];
    
    NSString *str = self.Id;
    NSLog(@"%@",str);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.douban.com/v2/onlines?apikey=02e4906e7a194c5008adb14b6e4be4f0%@",str]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSURLConnection *connection = [[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO]autorelease];
    
    [connection start];

    
    UILabel *restlabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, -500.0, 320, 450.0)];
    restlabel.font = [UIFont systemFontOfSize:15.0];
    restlabel.text = @"";
    self.restlabel = restlabel;
    [self.tableView addSubview:restlabel];
    
    
    UILabel *restlabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0.0, -100.0, 320, 13.0)];
    restlabel2.font = [UIFont systemFontOfSize:15.0];
    restlabel2.text = @"";
    self.restlabel2 = restlabel2;
    [self.tableView addSubview:restlabel2];
    
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
    NSString *responseString = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSDictionary *xmlDic = [responseString JSONValue];
    // NSLog(@"adsasdas%@",responseString3);
    NSLog(@"aaa%@",xmlDic);
    NSMutableArray *onlines = [NSMutableArray array];
  //  NSArray *onlineList = [xmlDic objectForKey:@"onlines"];
    
   // for (NSDictionary *dic in onlineList)
   // {
    OnLine *online = [[[OnLine alloc]init]autorelease];
    online.onlineTitle = [xmlDic objectForKey:@"title"];
    online.onlineDesc =  [xmlDic objectForKey:@"desc"];
    online.onlineId = [xmlDic objectForKey:@"album_id"];
    online.onlineURLString = [xmlDic objectForKey:@"cover"];
    //NSLog(@"!!!!!!!%@",online.onlineId);
    online.onlineOwner = [[xmlDic objectForKey:@"owner"]objectForKey:@"name"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:online.onlineURLString]];
    online.onlineImage = [UIImage imageWithData:imageData];
    // NSLog(@"bwajhfgfhwgfjwfjkfj%@",[_xmlDic3 objectForKey:@"desc"]);
    self.restlabel.text= online.onlineDesc;
    self.onlines = onlines;
    self.restlabel2.text = online.onlineOwner;
        NSLog(@"pppppp%@",self.restlabel.text);
    //}
    
    //        [self.books addObject:book];
    [self.tableView reloadData];
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 0)
    {
        // 标题
        static NSString *identifier = @"MessageTitleCell";
        
        // 重用
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        }
        
        //cell.textLabel.text = self.Name;
        cell.textLabel.textColor = [UIColor grayColor];
        cell.imageView.image = self.Image;
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(100.0, 20.0, 180.0, 70.0)];
        label3.textAlignment = NSTextAlignmentCenter;
        label3.backgroundColor = [UIColor clearColor];
        label3.font = [UIFont systemFontOfSize:15.0];
        //label1.textColor = [UIColor orangeColor];
        label3.text = self.Name;
        label3.numberOfLines=0;
        
        
        [cell.contentView addSubview:label3];
        
    }
    else if (indexPath.section == 1)
    {
        // 标题
        static NSString *identifier1 = @"MessageTitleCell";
        
        // 重用
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier1];
        if (!cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1] autorelease];
        }
        cell.textLabel.text = self.restlabel2.text;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 输入标题用的text field
        //        UILabel *restlabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 10.0, 150.0, 40.0)];
        //        restlabel.font = [UIFont systemFontOfSize:18.0];
        //        restlabel.text = @"";
        //        self.restlabel = restlabel;
        //        [cell.contentView addSubview:restlabel];
        //        [restlabel release];
        //cell.textLabel.text = self.label.text;
        
        
        
    }
    else
    {
        // 标题
        static NSString *identifier = @"MessageContentCell";
        
        // 重用
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        }
        
        //cell.textLabel.text = message.content;
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 10.0, 280.0, 400.0)];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.backgroundColor = [UIColor clearColor];
        label1.font = [UIFont systemFontOfSize:15.0];
        //label1.textColor = [UIColor orangeColor];
        label1.text =self.restlabel.text;
        label1.numberOfLines=0;
        [label1 sizeToFit];
        [cell.contentView addSubview:label1];
        
        
        
        
        //cell.detailTextLabel.text = self.restlabel.text;
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 )
    {
        return 100.0;
    }
    else if(indexPath.section == 1)
    {
        return 60.0;
    }
    else
    {
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 10.0, 280.0, 400.0)];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.backgroundColor = [UIColor clearColor];
        label1.font = [UIFont systemFontOfSize:15.0];
        //label1.textColor = [UIColor orangeColor];
        label1.text =self.restlabel.text;
        label1.numberOfLines=0;
        [label1 sizeToFit];
        return label1.frame.size.height+20;
        
        //return 600.0;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"活动:";
    }
    else if (section == 1)
    {
        return @"发起者";
    }
    else
    {
        return @"活动要求:";
    }
}

@end
