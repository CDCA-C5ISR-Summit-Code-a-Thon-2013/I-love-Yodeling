//
//  MapViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "LocationAnnotation.h"
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
    
    // set delegate
    _mapView.delegate = self;
    
    // add annotations
    [self addAnnotations];
}

- (void)viewDidAppear:(BOOL)animated
{
    // show user location
    _mapView.showsUserLocation = TRUE;
    
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
    
    Location *location = nil;
    LocationAnnotation *annotation = nil;
    
    // Applebee's 4910 Ashley Phosphate Road
    location = [[Location alloc] initWithName:@"Applebee's" andAddress:@"4910 Ashley Phosphate Road" andCoordinate:CLLocationCoordinate2DMake(32.918088, -80.103746)];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
//    annotation = [[LocationAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(32.918088, -80.103746) andName:@"Applebee's" andAddress:@"4910 Ashley Phosphate Road"];
    [_mapView addAnnotation:annotation];
    
    // Outback 32.95452,-80.038254 7643 Rivers Avenue
    location = [[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"7643 Rivers Avenue" andCoordinate:CLLocationCoordinate2DMake(32.95452, -80.038254)];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
//    annotation = [[LocationAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(32.95452, -80.038254) andName:@"Outback Steakhouse" andAddress:@"7643 Rivers Avenue"];
    [_mapView addAnnotation:annotation];
    
    // Outback 32.814401,-80.025895 1890 Sam Rittenberg Boulevard
    location = [[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"1890 Sam Rittenberg Boulevard" andCoordinate:CLLocationCoordinate2DMake(32.814401, -80.025895)];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
//    annotation = [[LocationAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(32.814401, -80.025895) andName:@"Outback Steakhouse" andAddress:@"1890 Sam Rittenberg Boulevard"];
    [_mapView addAnnotation:annotation];
    
    // Outback 32.825942,-79.880326 715 Johnnie Dodds Boulevard
    location = [[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"715 Johnnie Dodds Boulevard" andCoordinate:CLLocationCoordinate2DMake(32.825942, -79.880326)];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
//    annotation = [[LocationAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(32.825942, -79.880326) andName:@"Outback Steakhouse" andAddress:@"715 Johnnie Dodds Boulevard"];
    [_mapView addAnnotation:annotation];
    
    // Page's (32.791189,-79.877175) Okra Grill 302 Coleman Boulevard
    location = [[Location alloc] initWithName:@"Page's Okra Grill" andAddress:@"302 Coleman Boulevard" andCoordinate:CLLocationCoordinate2DMake(32.791189, -79.877175)];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
//    annotation = [[LocationAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(32.791189, -79.877175) andName:@"Page's Okra Grill" andAddress:@"302 Coleman Boulevard"];
    [_mapView addAnnotation:annotation];
}

#pragma mark - MKMapViewDelegate functions

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *annotationView = nil;
    
    if ([annotation isKindOfClass:[LocationAnnotation class]])
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"location"];
        annotationView.canShowCallout = YES;
    }
    
    return annotationView;
}

@end
