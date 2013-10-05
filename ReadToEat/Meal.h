//
//  Food.h
//  ReadToEat
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Price.h"

@interface Meal : NSObject
{
    NSString *name;
    NSString *date; // same as in parent object Menu
    NSMutableString *additive;
    Price *price;
}

@property (copy) NSString *name;
@property (copy) NSString *date;
@property (nonatomic, retain) NSMutableString *additive;
@property (nonatomic, retain) Price *price;


@end
