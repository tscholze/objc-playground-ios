//
//  de_tobonautViewController.h
//  SimpleTouchDemo
//
//  Created by Tobias Scholze on 4/13/12.
//

#import <UIKit/UIKit.h>

@interface de_tobonautViewController : UIViewController {
    IBOutlet UIImageView *fingerView;
}

@property (nonatomic, retain) IBOutlet UIImageView *fingerView;

- (void)showAlertView:(NSString*)msg;
- (void)setViewNonTouchable;

@end
