//
//  DetailViewController.h
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

@interface DetailViewController : UITableViewController

@property (nonatomic, strong) Session *session;

#pragma mark - IBOutlets

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UILabel *presenterLabel;
@property (nonatomic, strong) IBOutlet UILabel *detailsLabel;

@end
