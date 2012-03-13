//
//  SessionsViewController.m
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import "SessionsViewController.h"
#import "DetailViewController.h"
#import "Session.h"

@implementation SessionsViewController

@synthesize sessions;

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SessionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    Session *session = [self.sessions objectAtIndex:indexPath.row];
    cell.textLabel.text = session.title;
    cell.detailTextLabel.text = session.presenter;
    
    return cell;
}

#pragma mark - UIViewController methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    DetailViewController *detailViewController = [segue destinationViewController];
    detailViewController.session = [self.sessions objectAtIndex:selectedIndexPath.row];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    Session *session = [[Session alloc] init];
//    session.title = @"Your Session Title Here";
//    session.presenter = @"Your Name Here";
//
//    self.sessions = [NSArray arrayWithObject:session];

    NSString *sessionsPath = [[NSBundle mainBundle] pathForResource:@"Sessions" ofType:@"plist"];
    NSDictionary *sessionsData = [NSDictionary dictionaryWithContentsOfFile:sessionsPath];

    NSArray *titles = [sessionsData objectForKey:@"Titles"];
    NSArray *presenters = [sessionsData objectForKey:@"Presenters"];
    NSArray *details = [sessionsData objectForKey:@"Details"];

    NSMutableArray *sessionObjects = [NSMutableArray arrayWithCapacity:titles.count];

    for (NSInteger index = 0; index < titles.count; index++)
    {
        Session *session = [[Session alloc] init];
        session.title = [titles objectAtIndex:index];
        session.presenter = [presenters objectAtIndex:index];
        session.details = [details objectAtIndex:index];

        [sessionObjects addObject:session];
    }

    self.sessions = sessionObjects;
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.sessions = nil;
}

@end
