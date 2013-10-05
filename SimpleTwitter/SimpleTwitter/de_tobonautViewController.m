//
//  de_tobonautViewController.m
//  SimpleTwitter
//
//  Created by Tobias Scholze on 4/20/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//  Thanks to supertecnoboff for this brief tutorial.
//  Thanks to jaschon for the blue bird logo
//

#import "de_tobonautViewController.h"

@implementation de_tobonautViewController

#pragma mark - Tutorial method

- (IBAction)sendTweet
{
    TWTweetComposeViewController *tweetsheet = [[TWTweetComposeViewController alloc] init];
    [tweetsheet setInitialText:@"This tweet is just a test! Obj-c <3! Apple <3"];
    [self presentModalViewController:tweetsheet animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
