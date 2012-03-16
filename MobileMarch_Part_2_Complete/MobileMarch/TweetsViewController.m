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

    // Each tweet is an NSDictionary that we parsed from the JSON response. Keys and
    // values are documented on Twitters site:
    // https://dev.twitter.com/docs/api/1/get/search

    NSDictionary *tweet = [self.tweets objectAtIndex:indexPath.row];
    cell.textLabel.text = [tweet objectForKey:@"text"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (@%@)", [tweet objectForKey:@"from_user_name"], [tweet objectForKey:@"from_user"]];

    return cell;
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set the query string parameters.
    // See https://dev.twitter.com/docs/api/1/get/search for details.

    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
        @"#mobilemarch OR @mobilemarchtc", @"q",
        @"100", @"rpp",
        nil];

    // Create a new TWRequest object with the search URL.
    TWRequest *request = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"http://search.twitter.com/search.json"] parameters:parameters requestMethod:TWRequestMethodGET];

    // Start the request and send in a response handler block.
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
    {
        if ([urlResponse statusCode] == 200)
        {
            NSError *JSONError = nil;

            // Create an NSDictionary of results based on the JSON response from Twitter.
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&JSONError];

            if (JSONError == nil)
            {
                // Grab the tweets from the "results" key in the dictionary. See the docs
                // on Twitter's site for details about the search response JSON.
                self.tweets = [results objectForKey:@"results"];

                // Since the request runs on a background thread, we need to be sure to
                // invoke reloadData on the main thread. UI updates should always be
                // performed on the main thread.
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
