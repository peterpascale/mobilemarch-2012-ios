//
//  Developer.h
//  MobileMarch
//
//  Created by Developer on 3/16/12.
//  Copyright (c) 2012 TapHarmonic, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Developer : NSObject

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;

- (id)initWithFirstname:(NSString *)firstname lastname:(NSString *)lastname;

@end
