//
//  menuTableViewController.m
//  ReadToEat
//
//  Created by Tobias Scholze on 4/8/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import "menuTableViewController.h"
#import "MealDetailViewController.h"
#import "MensaXmlParser.h"
#import "Menu.h"

@implementation menuTableViewController
@synthesize menus, weekDays, parseMode, showNextWeek, tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

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
    // Get mode
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"urls" ofType:@"plist"];
    NSDictionary *mensen = [[NSDictionary alloc] initWithContentsOfFile:plistPath]; 
    NSDictionary *currentMensa = [mensen objectForKey:@"hsa-m"]; 
    
    NSString *url = [[NSString alloc] init];
    
    // General setting
    self.navigationController.toolbarHidden = NO;
    
    NSLog(@"Mode: %@",parseMode);
    // Do something...
    if ([parseMode length] == 0) {
        // set url
        url = [currentMensa objectForKey:@"current"];
    } else if ([parseMode isEqualToString:@"next"]) {
        // set url
        url =[currentMensa objectForKey:@"next"];
        // hide toolbar
        [showNextWeek setEnabled:NO];
    }
    
    // Get global array
    self.menus = [[NSMutableArray alloc] init];
    
    // Do the parse thingie.
    MensaXmlParser *parser = [[MensaXmlParser alloc] init];
    parser.urlAsString = url;
    self.menus = [parser getMenuList];
    weekDays = [[NSMutableArray alloc] initWithObjects:@"Montag", @"Dienstag", @"Mittwoch", @"Donnerstag", @"Freitag", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - DataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Menu *menu = [self.menus objectAtIndex:section];
    return [menu.meals count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*) tableView
{
    return [menus count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Menu *menu = [self.menus objectAtIndex:section];
    NSString *header = [NSString stringWithFormat:@"%@, %@", [weekDays objectAtIndex:section], [menu date]];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSString *uniqueIdentifier = @"MealCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    Menu *currentMenu = [self.menus objectAtIndex:indexPath.section];
    Meal *currentMeal = [currentMenu.meals objectAtIndex:indexPath.row];
    
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:uniqueIdentifier];
    }
    
    cell.textLabel.text = currentMeal.name;    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@€ / %@€, enthaelt: %@", currentMeal.price.student, currentMeal.price.normal, currentMeal.additive];
    
    return cell;
}

#pragma - Seque
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Segue triggerd!");
    if ([[segue identifier] isEqualToString:@"ShowSelectedMeal"]) {
        NSInteger row = [[self tableView].indexPathForSelectedRow row];
        NSInteger section = [[self tableView].indexPathForSelectedRow section];
        MealDetailViewController *detailController = [segue destinationViewController];
        Menu *selectedMenu = [menus objectAtIndex:section];
        Meal *selectedMeal = [[selectedMenu meals] objectAtIndex:row];
        
        [detailController setMeal:selectedMeal];
    } else if ([[segue identifier] isEqualToString:@"ShowNextWeek"]) {
        menuTableViewController *mtvc = [segue destinationViewController];
        mtvc.parseMode = @"next";
    }
    
}

@end
