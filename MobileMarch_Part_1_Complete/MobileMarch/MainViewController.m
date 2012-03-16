//
//  MainViewController.m
//  MobileMarch
//
//  Created by Bob McCune on 3/16/12.
//  Copyright (c) 2012 TapHarmonic, LLC. All rights reserved.
//

#import "MainViewController.h"
#import "Developer.h"
#import "ModalViewController.h"

@implementation MainViewController

- (IBAction)showAboutView:(id)sender {
    ModalViewController *mvc = [[ModalViewController alloc] init];
    mvc.developer = [[Developer alloc] initWithFirstname:@"<firstname>" lastname:@"<lastname>"];
    [self presentModalViewController:mvc animated:YES];
}

@end
