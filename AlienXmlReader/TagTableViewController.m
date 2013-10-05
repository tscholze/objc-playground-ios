//
//  TagTableViewController.m
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import "TagTableViewController.h"
#import "DetailAlienTagViewController.h"

@implementation TagTableViewController

@synthesize tagList;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tagList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TagCell";
    AlienTag *entry = [tagList objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    // Bracket Syntax
    [[cell textLabel] setText:[entry id]];
    [[cell detailTextLabel] setText: [NSString stringWithFormat:@"Last Seen: %@",[entry lastSeenTime]]];
    
    // Dot-Syntax
    //cell.textLabel.text = entry.title;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"Klick");
    // AlienTag *selectedTag = [tagList objectAtIndex:[indexPath row]];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tagList = [[NSMutableArray alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.hs-augsburg.de/~scholze/sonstiges/Alien-Example.xml"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    parser = [[AlienXmlParser alloc] init];
    self.tagList = [parser parseAlienXmlFile:data];    
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowSelectedTag"]) {
        NSInteger row = [[self tableView].indexPathForSelectedRow row];
        DetailAlienTagViewController *detailController = [segue destinationViewController];
        AlienTag *selectedTag = [tagList objectAtIndex:row];
        
        NSLog(@"sende Tag: %@", selectedTag.id);
        [detailController setTag:selectedTag];
    }
}


@end
