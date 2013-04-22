//
//  moviesViewController.h
//  DBanClient
//
//  Created by ibokan on 13-4-17.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface moviesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic,retain) UITableView*ListTableView;

@end
