//
//  DetailViewController.h
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

/// View controller to display details for a session.
///
@interface DetailViewController : UITableViewController

/// The session to display details for. This value is set in the SessionsViewController's
/// - prepareForSegue:segue sender:sender method. Details from this session are loaded
/// into the labels in the table in viewDidLoad.
///
@property (nonatomic, strong) Session *session;

#pragma mark - IBOutlets

/// Label to display the session title.
///
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

/// Label to display the session time.
///
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;

/// Label to display the session presenter.
///
@property (nonatomic, strong) IBOutlet UILabel *presenterLabel;

/// Label to display the session details.
///
@property (nonatomic, strong) IBOutlet UILabel *detailsLabel;

@end
