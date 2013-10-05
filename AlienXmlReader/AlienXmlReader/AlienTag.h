//
//  AlienTag.h
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlienTag : NSObject 
{
    NSString *id;
    NSString *discoveryTime;
    NSString *lastSeenTime;
    NSString *antenna;
    NSString *readCount;
    NSString *protocol;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *discoveryTime;
@property (nonatomic, retain) NSString *lastSeenTime;
@property (nonatomic, retain) NSString *antenna;
@property (nonatomic, retain) NSString *readCount;
@property (nonatomic, retain) NSString *protocol;


@end
