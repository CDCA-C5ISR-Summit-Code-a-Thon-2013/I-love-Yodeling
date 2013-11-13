//
//  SplashViewController.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()
{
    NSTimer *splashTimer;
}

@end

@implementation SplashViewController

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
    
    UIImage *image = [UIImage imageNamed:@"ggggggggggggg.png"];
    
    CGSize newSize = CGSizeMake(128.0f, 128.0f);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _splashImage.image = newImage;
    [_splashImage setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *bgLayer = [self blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
    splashTimer = [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(splashTimerExpired:) userInfo:nil repeats:FALSE];
}

- (void)splashTimerExpired:(id)sender
{
    [self performSegueWithIdentifier:@"SplashToMainSegue" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CAGradientLayer*) blueGradient
{
    UIColor *colorOne = [UIColor colorWithRed:(120/255.0) green:(135/255.0) blue:(150/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(57/255.0)  green:(79/255.0)  blue:(96/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}


@end
