//
//  XMLParser.m
//  SimpleXmlParser
//
//  Thanks to Marc Ammann! 
//  Link: http://codesofa.com/blog/archive/2008/07/23/make-nsxmlparser-your-friend.html
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

// Getter - Setter
@synthesize  currentAttribute, xmlEntries, currentXmlEntry;


#pragma mark - major parse method

- (void)parseXmlFile:(NSData *)data
{
    // Init vars
    // Notice: Data is a NS which is loaded in the de_tobonautViewController
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    self.xmlEntries = [[NSMutableArray alloc] init];
    
    // Set parser's delegate.
    [parser setDelegate:self];
    
    // Set parser's properties.
    
    // 1. we dont care about namespaces.
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    
    // 2. we just want the data.
    [parser setShouldResolveExternalEntities:NO];
    
    // Run parser
    [parser parse];
    
    NSLog(@"3. Parsing was successful ...");
    
    // Dump the array
    [self dumpXmlEntries];
}

#pragma mark - Delegate methodes

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.currentAttribute) 
    {
        [currentAttribute appendString:string];
    }
}

// is fired when the parser found a opening tag like <name>
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // Best practice, dunno why, yet.
    if(qName)
    {
        elementName = qName;
    }
    
    // if we found a attribute, safe it.
    if (self.currentXmlEntry) {
        if ([elementName isEqualToString:@"name"]) {
            self.currentAttribute = [[NSMutableString alloc] init];
        }
    } 
    else {
        // if we found a whole new section, init a new object.
        if ([elementName isEqualToString:@"food"]) {
            self.currentXmlEntry = [[XMLEntry alloc] init];
        }
    }
}

// fired if the parser found a closing tage like </name>
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (self.currentXmlEntry) {
        // if the section is now over, add the objet to the summary array.
        if ([elementName isEqualToString:@"food"]) {
            [xmlEntries addObject:currentXmlEntry];
            // dont forget to release!
            self.currentXmlEntry = nil;
        } else {
            // if a attribute tag is closed, save the attribute into a objects attribute.
            if ([elementName isEqualToString:@"name"]) {
                self.currentXmlEntry.title = self.currentAttribute;
            }
        }
    }
    // again, dont forget to release!
    self.currentAttribute = nil;
}

#pragma mark - Helper methods

// Just a little helper which prints ever title out.
- (void)dumpXmlEntries
{
    NSLog(@"4. Dump Array ...");
    NSLog(@"---------------");
    int count = [xmlEntries count];
    for(int i = 0; i < count; i++) {
        XMLEntry *entry = [xmlEntries objectAtIndex:i];
        NSLog(@"Title: %@", entry.title);
    }
}

@end
