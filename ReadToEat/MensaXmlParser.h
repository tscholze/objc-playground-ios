//
//  MensaXmlParser.h
//  ReadToEat
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"
#import "Price.h"
#import "Meal.h"

@interface MensaXmlParser : NSObject <NSXMLParserDelegate>
{
    NSString *urlAsString;
    Menu *currentMenu;
    Meal *currentMeal;
    Price *currentPrice;
    NSMutableString *currentProperty;
    NSMutableString *currentAdditive;
    NSMutableArray *menus;
}

// Getter and Setter
@property (copy) NSString *urlAsString;
@property (nonatomic, retain) Menu *currentMenu;
@property (nonatomic, retain) Meal *currentMeal;
@property (nonatomic, retain) Price *currentPrice;
@property (nonatomic, retain) NSMutableString *currentProperty;
@property (nonatomic, retain) NSMutableString *currentAdditive;
@property (nonatomic, retain) NSMutableArray *menus;

// Methods
- (void)parseMensaXml:(NSData*) data;
- (void)dumpMenuList;
- (NSMutableArray*)getMenuList;

@end
