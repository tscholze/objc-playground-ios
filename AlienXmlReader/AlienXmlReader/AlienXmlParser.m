//
//  AlienXmlParser.m
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import "AlienXmlParser.h"

@implementation AlienXmlParser

@synthesize currentTag, currentProperty, tagList;

- (NSMutableArray *)parseAlienXmlFile:(NSData *)data
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    self.tagList = [[NSMutableArray alloc] init];
    
    [parser setDelegate:self];
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
 
    [self dumpTagList];
    return self.tagList;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.currentProperty) 
    {
        [currentProperty appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // Best practice, dunno why, yet.
    if(qName)
    {
        elementName = qName;
    }
    
    // if we found a attribute, safe it.
    if (self.currentTag) {
        if ([elementName isEqualToString:@"TagID"] || [elementName isEqualToString:@"DiscoveryTime"] || [elementName isEqualToString:@"LastSeenTime"] || [elementName isEqualToString:@"Antenna"] || [elementName isEqualToString:@"ReadCount"] || [elementName isEqualToString:@"Protocol"]) {
            self.currentProperty = [[NSMutableString alloc] init];
        }
    } 
    else {
        // if we found a whole new section, init a new object.
        if ([elementName isEqualToString:@"Alien-RFID-Tag"]) {
            self.currentTag = [[AlienTag alloc] init];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (self.currentTag) {
        // if the section is now over, add the objet to the summary array.
        if ([elementName isEqualToString:@"Alien-RFID-Tag"]) {
            [self.tagList addObject:currentTag];
            // dont forget to release!
            self.currentTag = nil;
        } else {
            // if a attribute tag is closed, save the attribute into a objects attribute.
            if ([elementName isEqualToString:@"TagID"]) {
                self.currentTag.id = self.currentProperty;
            }
            
            if ([elementName isEqualToString:@"DiscoveryTime"]) {
                self.currentTag.discoveryTime = self.currentProperty;
            }
            
            if ([elementName isEqualToString:@"LastSeenTime"]) {
                self.currentTag.lastSeenTime = self.currentProperty;
            }
            
            if ([elementName isEqualToString:@"Antenna"]) {
                self.currentTag.antenna = self.currentProperty;
            }
            
            if ([elementName isEqualToString:@"ReadCount"]) {
                self.currentTag.readCount = self.currentProperty;
            }
            
            if ([elementName isEqualToString:@"Protocol"]) {
                self.currentTag.protocol = self.currentProperty;
            }
        }
    }
    // again, dont forget to release!
    self.currentProperty = nil;
}

- (void)dumpTagList
{
    int count = [tagList count];
    NSLog(@"Count: %i", count);
    for(int i = 0; i < count; i++) {
        AlienTag *entry = [tagList objectAtIndex:i];
        NSLog(@"----------------");
        NSLog(@"ID: %@", entry.id);
        NSLog(@"DiscoveryTime: %@", entry.discoveryTime);
        NSLog(@"LastSeenTime: %@", entry.lastSeenTime);
        NSLog(@"Antenna: %@", entry.antenna);
        NSLog(@"ReadCount: %@", entry.readCount);
        NSLog(@"Protocol: %@", entry.protocol);
    }
}

@end
