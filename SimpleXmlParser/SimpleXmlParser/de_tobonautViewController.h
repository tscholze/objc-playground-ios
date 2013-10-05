//
//  de_tobonautViewController.h
//  SimpleXmlParser
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface de_tobonautViewController : UIViewController {
    XMLParser *xmlParser;
}

@property (nonatomic, retain) XMLParser *xmlParser;

@end
