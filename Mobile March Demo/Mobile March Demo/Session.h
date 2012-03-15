//
//  Session.h
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Model object that represents a Mobile March session. Session objects are created
/// in SessionsViewController's viewDidLoad method based on data in Sessions.plist. The
/// objects are used to display info in the SessionsViewController and DetailViewController.
///
@interface Session : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *presenter;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSString *time;

@end
