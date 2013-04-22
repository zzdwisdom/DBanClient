//
//  moviesViewController.m
//  DBanClient
//
//  Created by ibokan on 13-4-17.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "moviesViewController.h"
#import "movie.h"
#import "JSON.h"
#import "OnLine.h"
#import "Book.h"
#import "Author.h"

@interface moviesViewController ()

    

{
   NSArray *segmentedControlArray;
  UISearchBar * _searchBar;
    
}

@property (nonatomic, retain) UITableView *tableView;

@end

@implementation moviesViewController
@synthesize ListTableView = _ListTableView;
-(void)dealloc
{
    [_ListTableView release];
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
    //创建分区视图
    
    segmentedControlArray = [NSArray arrayWithObjects:@"上映",@"影院",@"我看", nil];
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedControlArray];
    segmentedControl.momentary  = YES;
    segmentedControl.segmentedControlStyle = UISegmentedControlNoSegment;
    segmentedControl.frame = CGRectMake(0, 0, 320, 50);
    segmentedControl.tintColor = [UIColor blackColor];
  
    segmentedControl.selectedSegmentIndex=0;
    [self.view addSubview:segmentedControl];
    //创建让search贴上的一个view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 50.0, 320.0,  40.0)];
    headerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:headerView];
    
    //创建视频列表视图
    _ListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0, 100.0, 320.0, 330.0) style:UITableViewStylePlain];
    _ListTableView.rowHeight = 50;
    _ListTableView.tag = 1;
    _ListTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_ListTableView];
    //创建搜索控制器
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, -44, 320, 44)];
    _searchBar.tintColor = [UIColor grayColor];
    _searchBar.frame = CGRectMake(0, 70, 320, 0);
    _searchBar.barStyle=UIBarStyleDefault;
//    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
}

@end

