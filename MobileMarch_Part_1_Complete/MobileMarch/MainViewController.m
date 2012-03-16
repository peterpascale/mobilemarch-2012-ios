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

- (IBAction)showAboutView:(id)sender {
    ModalViewController *mvc = [[ModalViewController alloc] init];
    mvc.developer = [[Developer alloc] initWithFirstname:@"<firstname>" lastname:@"<lastname>"];
    [self presentModalViewController:mvc animated:YES];
}

@end
