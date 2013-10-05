//
//  MensaXmlParser.m
//  ReadToEat
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import "MensaXmlParser.h"
#import "Menu.h"

@implementation MensaXmlParser

@synthesize currentMenu, currentProperty, currentAdditive, currentMeal, currentPrice, menus, urlAsString;

- (void)parseMensaXml:(NSData *)data
{
    
    // Init parser
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    // Set delegate
    [parser setDelegate:self];
    
    // Init summary array
    self.menus = [[NSMutableArray alloc] init];
    
    // Set some properties
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    // Run parser
    [parser parse];
    
    // Dump list
    // [self dumpMenuList];
}

- (NSMutableArray*)getMenuList
{
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    [self parseMensaXml:[[NSData alloc] initWithContentsOfURL:url]];
    return self.menus;
}

- (void)dumpMenuList
{
    for (int i = 0; i < [self.menus count]; i++) {
        Menu *menu = [menus objectAtIndex: i];
        NSLog(@"Date: %@", menu.date);
        for(int j = 0; j < [menu.meals count]; j++) {
            Meal *meal = [menu.meals objectAtIndex: j];
            NSLog(@"Name: %@", meal.name);
            NSLog(@"Preis (Student / Andere): %@ / %@", meal.price.student, meal.price.normal);
            NSLog(@"Zusatzstoffe: %@", meal.additive);
            NSLog(@"--");
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.currentProperty) {
        [currentProperty appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) {
        elementName = qName; 
    }
    
    if (self.currentMenu) {
        if ([elementName isEqualToString:@"date"] || [elementName isEqualToString:@"name"] || [elementName isEqualToString:@"student"] || [elementName isEqualToString:@"normal"] || [elementName isEqualToString:@"additive"]) {
            self.currentProperty = [[NSMutableString alloc] init];
        }
        
        if ([elementName isEqualToString:@"meal"]) {
            self.currentMeal = [[Meal alloc] init];
            self.currentMeal.additive = [[NSMutableString alloc] init];
            self.currentMeal.date = self.currentMenu.date;
        }
        
        if([elementName isEqualToString:@"prices"]) {
            self.currentPrice = [[Price alloc] init];
        }
        
    } else {
        if ([elementName isEqualToString:@"menu"]) {
            self.currentMenu = [[Menu alloc] init];
            self.currentMenu.meals = [[NSMutableArray alloc] init];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if (qName) {
        elementName = qName;
    }
    
    if(self.currentMenu) {
        if ([elementName isEqualToString:@"date"]) {
            self.currentMenu.date = self.currentProperty;
        } 
        
        else if ([elementName isEqualToString:@"meal"]) {
            [[currentMenu meals] addObject:currentMeal];
            self.currentMeal = nil;
        }
        
        else if ([elementName isEqualToString:@"name"]) {
            self.currentMeal.name = self.currentProperty;
        }
        
        else if ([elementName isEqualToString:@"menu"]) {
            [self.menus addObject:self.currentMenu];
            self.currentMenu = nil;
        }
        
        else if ([elementName isEqualToString:@"student"]) {
            self.currentPrice.student = self.currentProperty;
        }
        
        else if ([elementName isEqualToString:@"normal"]) {
            self.currentPrice.normal = self.currentProperty;
        }
        
        else if ([elementName isEqualToString:@"prices"]) {
            self.currentMeal.price = self.currentPrice;
            currentPrice = nil;
        }
        
        else if ([elementName isEqualToString:@"additive"]) {
            if ([self.currentProperty isEqualToString:@""]) {
                [self.currentMeal.additive appendString:@"keine Zusatzstoffe."];
            } else {
                [self.currentMeal.additive appendString:[NSString stringWithFormat:@"%@ ", self.currentProperty]];
            }
        }
    }
    
    self.currentProperty = nil;
}



@end
