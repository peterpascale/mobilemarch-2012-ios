//
//  DetailViewController.m
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import "DetailViewController.h"

static CGFloat const DetailCellWidth = 280.0;
static CGFloat const DetailCellFontSize = 17.0;
static CGFloat const DetailCellVerticalPadding = 10.0;
static UILineBreakMode const DetailCellLineBreakMode = UILineBreakModeWordWrap;
static UIFont *DetailCellFont;

@implementation DetailViewController

@synthesize session;

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    switch (indexPath.section)
    {
        case 0:
            cell.textLabel.text = session.title;
            break;

        case 1:
            cell.textLabel.text = session.presenter;
            break;

        case 2:
            cell.textLabel.text = session.details;
            break;
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"Title";

        case 1:
            return @"Presenter";

        case 2:
            return @"Description";

        default:
            return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = nil;

    switch (indexPath.section)
    {
        case 0:
            text = session.title;
            break;

        case 1:
            text = session.presenter;
            break;

        case 2:
            text = session.details;
            break;
    }

    if (DetailCellFont == nil)
    {
        DetailCellFont = [UIFont boldSystemFontOfSize:DetailCellFontSize];
    }

    CGSize maxSize = CGSizeMake(DetailCellWidth, CGFLOAT_MAX);
    CGSize textSize = [text sizeWithFont:DetailCellFont constrainedToSize:maxSize lineBreakMode:DetailCellLineBreakMode];

    return textSize.height + DetailCellVerticalPadding * 2.0;
}

@end
