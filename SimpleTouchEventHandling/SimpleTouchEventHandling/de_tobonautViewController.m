//
//  de_tobonautViewController.m
//  SimpleTouchDemo
//
//  Created by Tobias Scholze on 4/13/12.
//  Thanks to Mohammad Azam tutorials! 
//  Video: (http://youtu.be/TE3tndXUzSU)
//
//  Icon: BenBois
//  Link: http://openclipart.org/detail/160447/multitouch-interface-mouse-theme-1-finger-simple-tap-by-benbois
//  No rights reserved.
//

#import "de_tobonautViewController.h"

@implementation de_tobonautViewController

#pragma mark - Getter/Setter

@synthesize fingerView;

#pragma mark - Tutorial methods

// Fired when you touch the screen.
// Doubletap leads to two method calls.
// Hold and move leads to a single method call with the start location.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    // CGPoint is a struct, do not use a pointer!
    CGPoint location = [[touches anyObject] locationInView:self.view];
    
    // Just assemble a simple log message
    NSString *msg = [[NSString alloc] initWithFormat:@"x-Position: %f \n y-Position: %f.", location.x, location.y];
    
    // Display the position data
    // Notice: if you will test the touchesEnded-method, please comment the following line out.
    [self showAlertView:msg];
    
    // Console logger.
    // Notice: Ignore the warning, the string is secure :)
    // NSLog(msg);
}

// Fired when you move up your finger.
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Notice: uncomment the following line if you will test this event handling.
    // [self showAlertView:@"Touch ended."];
}

// Fired (instantly) when you move your finger on the screen
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Notice: uncomment the following line if you will test this event handling
    // Tip: Use touchesBegan() and touchesEnded() for calculating a position diff.
    // [self showAlertView:@"You moved your finger!"];
}

// Sets the parentview nontouchable
- (void)setViewNonTouchable
{
    // Disable the whole (parent) view
    // [self.view setUserInteractionEnabled:NO];
    
    // Useless, because every childview inhertis the parents propeperty if it is touchable or not.
    // [self.fingerView setUserInteractionEnabled:NO];
}

#pragma mark - Helpers

// Tiny helper which shows a Alert Popup with a given string.
- (void)showAlertView:(NSString *)msg
{
    [[[UIAlertView alloc] initWithTitle:@"Touch detected!" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Just for tutorial purpose
    [self setViewNonTouchable];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.fingerView = nil;
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
