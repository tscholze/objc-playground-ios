//
//  AlienXmlParser.h
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlienTag.h"

@interface AlienXmlParser : NSObject <NSXMLParserDelegate>
{
    AlienTag *currentTag;
    NSMutableString *currentProperty;
    NSMutableArray *tagList;
}

@property (nonatomic, retain) AlienTag *currentTag;
@property (nonatomic, retain) NSMutableString *currentProperty;
@property (nonatomic, retain) NSMutableArray *tagList;

- (NSMutableArray *)parseAlienXmlFile:(NSData *)data;
- (void)dumpTagList;

@end
