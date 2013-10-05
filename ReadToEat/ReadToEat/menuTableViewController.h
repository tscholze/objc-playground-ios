//
//  menuTableViewController.h
//  ReadToEat
//
//  Created by Tobias Scholze on 4/8/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"

@interface menuTableViewController : UIViewController<UITableViewDataSource>
{
    NSString *parseMode;
    NSMutableArray *menus;
    NSMutableArray *weekDays;
    
    IBOutlet UITableView *tableView;
    IBOutlet UIBarButtonItem *showNextWeek;
}

@property (copy) NSString *parseMode;
@property (nonatomic, retain) NSMutableArray *menus;
@property (nonatomic, retain) NSMutableArray *weekDays;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *showNextWeek;


@end
