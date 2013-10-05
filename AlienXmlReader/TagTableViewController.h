//
//  TagTableViewController.h
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlienTag.h"
#import "AlienXmlParser.h"

@interface TagTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *tagList;
    AlienXmlParser *parser;
}

@property (nonatomic, retain) NSMutableArray *tagList;

@end
