//
//  de_tobonautViewController.h
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlienXmlParser.h"

@interface de_tobonautViewController : UIViewController
{
    AlienXmlParser *parser;
}

@property (nonatomic, retain) AlienXmlParser *parser;

@end
