//
//  de_tobonautViewController.m
//  SimpleXmlParser
//
//  Thanks to Marc Ammann! 
//  Link: http://codesofa.com/blog/archive/2008/07/23/make-nsxmlparser-your-friend.html
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import "de_tobonautViewController.h"

@implementation de_tobonautViewController

@synthesize xmlParser;

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
    
    NSLog(@"1. Init parser class ...");
    self.xmlParser = [[XMLParser alloc] init];
    
    NSLog(@"2. Fire parseXml-method ...");
    [xmlParser parseXmlFile:[[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:@"http://www.hs-augsburg.de/~hippi/mensa.xml"]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.xmlParser = nil;
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
