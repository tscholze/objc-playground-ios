//
//  MealDetailViewController.h
//  ReadToEat
//
//  Created by Tobias Scholze on 6/13/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <twitter/twitter.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "Menu.h"

@interface MealDetailViewController : UIViewController {
    Meal *meal;
    IBOutlet UILabel *name;
    IBOutlet UILabel *price;
    IBOutlet UILabel *additive;
}

- (IBAction)sendTweet;
- (IBAction)setReminder;
@property (nonatomic, retain) Meal *meal;

@end
