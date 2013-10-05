//
//  myTableViewController.h
//  SimpleTableView
//
//  Created by Tobias Scholze on 4/14/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewController : UITableViewController
{
    NSMutableArray *entries;
}

@property (nonatomic, retain) NSMutableArray *entries;

@end
