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
    
    UIToolbar *toolBar;
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    toolBar.frame = CGRectMake(0, 20, 320, 50);
    toolBar.barStyle = UIBarStyleDefault;
    [toolBar sizeToFit];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"DONE" style:UIBarButtonItemStyleBordered target:self action:@selector(doneAction)];
    
    
    NSArray *barButton  =   [[NSArray alloc] initWithObjects:flexibleSpace,doneButton,nil];
    [toolBar setItems:barButton];
    
    [self.view addSubview:toolBar];
    barButton = nil;
    
    [_businessDealLabel setBackgroundColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0]];

    _addressLabel.text = _businessAddress;
    _businessDealLabel.text = _businessDealText;
    _businessNameLabel.text = _businessNameText;
    _businessImageView.image = [_businessImage applyBobbyEffect];;
}

-(void)doneAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
