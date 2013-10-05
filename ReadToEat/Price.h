//
//  Price.h
//  ReadToEat
//
//  Created by Tobias Scholze on 4/15/12.
//  Copyright (c) 2012 tspin GbR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Price : NSObject 
{
    NSString *student;
    NSString *normal;
}

@property (copy) NSString *student;
@property (copy) NSString *normal;

@end
