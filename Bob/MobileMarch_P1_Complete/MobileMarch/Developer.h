//
//  Developer.h
//  MobileMarch
//
//  Created by Bob McCune on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Developer : NSObject

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;

- (id)initWithFirstname:(NSString *)firstname lastname:(NSString *)lastname;

@end
