//
//  Menu.h
//  ReadToEat
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meal.h"

@interface Menu : NSObject {
    NSString *date;
    NSMutableArray *meals;
}

@property (copy) NSString *date;
@property (nonatomic, retain) NSMutableArray *meals;

@end
