//
//  AlienReader.h
//  AlienXmlReader
//
//  Created by Tobias Scholze on 4/17/12.
//  Copyright (c) 2012 Everybody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlienReader : NSObject
{
    NSString *name;
    NSString *type;
    NSString *ipAddress;
    NSString *comPort;
    NSString *macAddress;
    NSString *time;
    NSString *reason;
    NSString *startTriggerLines;
    NSString *stopTriggerLines;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *ipAddress;
@property (nonatomic, retain) NSString *comPort;
@property (nonatomic, retain) NSString *macAddress;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *reason;
@property (nonatomic, retain) NSString *startTriggerLines;
@property (nonatomic, retain) NSString *stopTriggerLines;

@end
