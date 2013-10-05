//
//  myTableViewEntry.m
//  SimpleTableView
//
//  Created by Tobias Scholze on 4/14/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import "myTableViewEntry.h"

@implementation myTableViewEntry

@synthesize title;

-(myTableViewEntry*) initWithTitle:(NSString *)entryTitle
{
    myTableViewEntry *entry = [[myTableViewEntry alloc] init];
    [entry setTitle:entryTitle];
    return entry;
}

@end
