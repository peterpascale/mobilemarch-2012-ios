//
//  Session.h
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *presenter;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSString *time;

@end
