//
//  myTableViewEntry.h
//  SimpleTableView
//
//  Created by Tobias Scholze on 4/14/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myTableViewEntry : NSObject {
    NSString *title;
}

@property (nonatomic, retain) NSString *title;

-(myTableViewEntry*)initWithTitle:(NSString*)entryTitle;

@end
