//
//  ModalViewController.m
//  MobileMarch
//
//  Created by Developer on 3/16/12.
//  Copyright (c) 2012 TapHarmonic, LLC. All rights reserved.
//


#import "ModalViewController.h"

@implementation ModalViewController

@synthesize developer = _developer;
@synthesize developedByLabel = _developedByLabel;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *firstname = self.developer.firstname;
    NSString *lastname = self.developer.lastname;
    self.developedByLabel.text = [NSString stringWithFormat:@"%@ %@", firstname, lastname];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self setDevelopedByLabel:nil];
}

- (IBAction)closeModalView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
