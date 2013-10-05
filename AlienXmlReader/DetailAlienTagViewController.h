//
//  DetailAlienTagViewController.h
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/19/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlienTag.h"

@interface DetailAlienTagViewController : UIViewController
{
    AlienTag *tag;
    IBOutlet UITextField *tagId;
    IBOutlet UITextField *tagDiscoverd;
    IBOutlet UITextField *tagLastSeen;
    IBOutlet UITextField *tagAntenna;
    IBOutlet UITextField *tagProtocol;
}

@property (nonatomic, strong) AlienTag *tag;

@end
