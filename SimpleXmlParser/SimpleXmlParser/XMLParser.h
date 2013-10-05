//
//  XMLParser.h
//  SimpleXmlParser
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLEntry.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
    XMLEntry *currentXmlEntry;
    NSMutableString *currentAttribute;
    NSMutableArray *xmlEntries;
}

@property (nonatomic, retain) XMLEntry *currentXmlEntry;
@property (nonatomic, retain) NSMutableString *currentAttribute;
@property (nonatomic, retain) NSMutableArray *xmlEntries;

- (void)parseXmlFile:(NSData *)data;
- (void)dumpXmlEntries;

@end
