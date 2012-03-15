//
//  Developer.m
//  MobileMarch
//
//  Created by Bob McCune on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Developer.h"

@implementation Developer

@synthesize firstname = _firstname;
@synthesize lastname = _lastname;

- (id)initWithFirstname:(NSString *)firstname lastname:(NSString *)lastname {
    self = [super init];
    if (self) {
        self.firstname = firstname;
        self.lastname = lastname;
    }
    return self;
}

@end
