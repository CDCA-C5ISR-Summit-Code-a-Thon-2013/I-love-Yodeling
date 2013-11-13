//
//  BusinessDetailsViewController.m
//  SmartTravel
//
//  Created by Bobby Strickland on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "BusinessDetailsViewController.h"
#import "UIImage+ImageEffects.h"

@interface BusinessDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *businessNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UITextView *businessDealLabel;
@property (weak, nonatomic) IBOutlet UIImageView *businessImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation BusinessDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    [_businessDealLabel setBackgroundColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0]];

    _addressLabel.text = _businessAddress;
    _businessDealLabel.text = _businessDealText;
    _businessNameLabel.text = _businessNameText;
    _businessImageView.image = [_businessImage applyBobbyEffect];
    [_contentView setBackgroundColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:.75]];
    
//    _businessDealLabel.editable = YES;
//    _businessDealLabel.font = [UIFont fontWithName:@"System" size:40];
    
    _businessDealLabel.text = _businessDealText;
    [_businessDealLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:20.0f]];
    _businessDealLabel.textColor = [UIColor blackColor];
    
    [_contentView.layer setCornerRadius:30];

//    _businessDealLabel.editable = NO;
}
- (IBAction)donePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
