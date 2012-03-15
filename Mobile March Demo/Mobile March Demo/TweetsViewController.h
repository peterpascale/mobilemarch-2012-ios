//
//  TweetsViewController.h
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Displays a list of tweets related to Mobile March. Tweets are loaded via the iOS 5
/// Twitter Framework.
///
@interface TweetsViewController : UITableViewController

/// An array that is populated with tweets via a TWRequest object. The initial request is
/// started in viewDidLoad.
///
@property (nonatomic, strong) NSArray *tweets;

@end
