//
//  TweetsViewController.m
//  Mobile March Demo
//
//  Created by Samuel Kirchmeier on 3/12/12.
//  Copyright (c) 2012 Livefront. All rights reserved.
//

#import <Twitter/Twitter.h>
#import "TweetsViewController.h"

@implementation TweetsViewController

@synthesize tweets;

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    NSDictionary *tweet = [self.tweets objectAtIndex:indexPath.row];
    cell.textLabel.text = [tweet objectForKey:@"text"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (@%@)", [tweet objectForKey:@"from_user_name"], [tweet objectForKey:@"from_user"]];

    return cell;
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
        @"#mobilemarch OR @mobilemarchtc", @"q",
        @"100", @"rpp",
        nil];

    TWRequest *request = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"http://search.twitter.com/search.json"] parameters:parameters requestMethod:TWRequestMethodGET];

    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
    {
        if ([urlResponse statusCode] == 200)
        {
            NSError *JSONError = nil;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&JSONError];

            if (JSONError == nil)
            {
                self.tweets = [results objectForKey:@"results"];
                [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            }
            else
            {
                NSLog(@"Twitter JSON parsing error %@", JSONError);
            }
        }
        else if ([urlResponse statusCode] == 420)
        {
            NSLog(@"Twitter says we're doing too many searches! %@", error);
        }
        else
        {
            NSLog(@"Twitter search error %@", error);
        }
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.tweets = nil;
}

@end
