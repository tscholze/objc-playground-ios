//
//  MealDetailViewController.m
//  ReadToEat
//
//  Created by Tobias Scholze on 6/13/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import "MealDetailViewController.h"

@implementation MealDetailViewController

@synthesize meal;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    name.text = meal.name;
    price.text = [NSString stringWithFormat:@"%@€ (Student) / %@€ (Sonstige)", meal.price.student, meal.price.normal];
    additive.text = meal.additive;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - Twitter
- (IBAction)sendTweet
{
    TWTweetComposeViewController *tweetsheet = [[TWTweetComposeViewController alloc] init];
    NSString *msg = [NSString stringWithFormat:@"Esse gerade %@ in der Mensa, kostet nur %@ Euro! - via @WasSollIchEssenApp", meal.name, meal.price.student];
    [tweetsheet setInitialText:msg];
    [self presentModalViewController:tweetsheet animated:YES];
}

#pragma - Reminder
- (IBAction)setReminder
{
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
    event.title = meal.name;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    NSArray *dateAsArray = [meal.date componentsSeparatedByString:@"."];
    
    dc.day = [[dateAsArray objectAtIndex:0] integerValue];
    dc.month = [[dateAsArray objectAtIndex:1] integerValue];
    dc.year = [[dateAsArray objectAtIndex:2] integerValue];
    
    // Start 11am.
    dc.hour = 11;
    event.startDate = [calendar dateFromComponents:dc];
    
    // End 2pm.
    dc.hour = 14;
    event.endDate = [calendar dateFromComponents:dc];
    
    NSError *err;
    
    event.calendar = eventStore.defaultCalendarForNewEvents;
    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
    
    // Error Handling mit ARC ist foo!
}

@end
