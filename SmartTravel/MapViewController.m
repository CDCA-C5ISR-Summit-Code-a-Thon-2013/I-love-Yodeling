//
//  MapViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MapViewController.h"

@interface MapViewController ()

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

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
    
    // show user location
    _mapView.showsUserLocation = TRUE;
}

- (void)viewDidAppear:(BOOL)animated
{
    // we want the map to be zoomed in a specific region
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(32.9, -79.9158);
    [_mapView setCenterCoordinate:coordinate animated:FALSE];
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.5, 0.5));
    [_mapView setRegion:region];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //map stuff
    // Dispose of any resources that can be recreated.
}

- (void)addAnnotations
{
    // Applebee's - Ashley Phosphate
//    32.918088,-80.103746
//    CLLocationCoordinate2D coordinate;
//    coordinate = CLLocationCoordinate2DMake(32.918088, -80.103746);
//    MKAnnotationView *annotation = MKAnnotat
//    _mapView addAnnotation:<#(id<MKAnnotation>)#>
}

@end
