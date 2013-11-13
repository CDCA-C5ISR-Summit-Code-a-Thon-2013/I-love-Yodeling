//
//  BusinessDetailsViewController.m
//  SmartTravel
//
//  Created by Bobby Strickland on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "BusinessDetailsViewController.h"

@interface BusinessDetailsViewController ()

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
    [super viewDidLoad];

	// Do any additional setup after loading the view.
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
