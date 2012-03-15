//
//  SessionsViewController.h
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Lists all of the Mobile March tech track sessions in a table view. Data for the table
/// is loaded from Sessions.plist.
///
@interface SessionsViewController : UITableViewController

/// Array of sessions to list in the table. The sessions are loaded from Sessions.plist
/// in viewDidLoad.
///
@property (nonatomic, strong) NSArray *sessions;

@end
