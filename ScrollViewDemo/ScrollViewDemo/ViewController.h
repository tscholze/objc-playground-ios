//
//  ViewController.h
//  ScrollViewDemo
//
//  Created by Tobias Scholze on 8/26/12.
//  Copyright (c) 2012 Tobias Scholze. No rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDelegate>
{
    UIScrollView* scrollView;
    UIPageControl* pageControl;
}

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;

@end
