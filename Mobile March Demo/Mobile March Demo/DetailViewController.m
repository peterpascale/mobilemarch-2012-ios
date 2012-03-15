//
//  DetailViewController.m
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import "DetailViewController.h"

static CGFloat const DetailLabelWidth = 280.0;
static CGFloat const DetailLabelVerticalPadding = 18.0;

@implementation DetailViewController

@synthesize session;

@synthesize titleLabel;
@synthesize timeLabel;
@synthesize presenterLabel;
@synthesize detailsLabel;

#pragma mark - UITableViewDataSource methods

// UITableViewDataSource methods? We don't need no stinking UITableViewDataSource methods.

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *label = nil;

    switch (indexPath.section)
    {
        case 0:
            label = self.titleLabel;
            break;

        case 1:
            label = self.timeLabel;
            break;

        case 2:
            label = self.presenterLabel;
            break;

        case 3:
            label = self.detailsLabel;
            break;
    }

    // Note: this won't work in landscape, because the label's width will be bigger!
    CGSize maxSize = CGSizeMake(DetailLabelWidth, CGFLOAT_MAX);
    CGSize textSize = [label.text sizeWithFont:label.font constrainedToSize:maxSize lineBreakMode:label.lineBreakMode];

    return textSize.height + DetailLabelVerticalPadding;
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.titleLabel.text = self.session.title;
    self.timeLabel.text = self.session.time;
    self.presenterLabel.text = self.session.presenter;
    self.detailsLabel.text = self.session.details;
}

@end
