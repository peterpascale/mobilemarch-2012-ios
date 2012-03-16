//
//  MainViewController.m
//  MobileMarch
//
//  Created by Developer on 3/16/12.
//  Copyright (c) 2012 TapHarmonic, LLC. All rights reserved.
//

#import "MainViewController.h"
#import "Developer.h"
#import "ModalViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidUnload {
    [super viewDidUnload];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalViewControllerSegue"] == YES) {
        ModalViewController *modalViewController = [segue destinationViewController];
        modalViewController.developer = [[Developer alloc] initWithFirstname:@"<firstname>" lastname:@"<lastname>"];
    }
}

@end
