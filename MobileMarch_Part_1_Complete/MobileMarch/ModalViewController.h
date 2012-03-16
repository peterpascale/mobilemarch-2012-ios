//
//  ModalViewController.h
//  MobileMarch
//
//  Created by Developer on 3/16/12.
//  Copyright (c) 2012 TapHarmonic, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Developer.h"

@interface ModalViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *developedByLabel;
@property (nonatomic, strong) Developer *developer;

- (IBAction)closeModalView:(id)sender;

@end
