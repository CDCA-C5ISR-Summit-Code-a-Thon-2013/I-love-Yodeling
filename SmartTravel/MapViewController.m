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
#import "MockData.h"
#import "BeaconManager.h"

@interface MapViewController ()

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) BeaconManager *beaconManager;

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
    
    _beaconManager = [[BeaconManager alloc] initWithUUID:@"9f1fcde8-47c2-11e3-86ae-ce3f5508acd9" identifier:@"com.smarttravel"];
    _beaconManager.delegate = self;
    [_beaconManager startBeaconRanging];
    
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
    Location *location = nil;
    MockData *mockData = [[MockData alloc] init];
    LocationAnnotation *annotation = nil;
    NSArray *locationArray = [mockData getLocationData];
    
    // Applebee's 4910 Ashley Phosphate Road
    location = [locationArray objectAtIndex:0];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
    [_mapView addAnnotation:annotation];
    
    // Outback 32.95452,-80.038254 7643 Rivers Avenue
    location = [locationArray objectAtIndex:1];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
    [_mapView addAnnotation:annotation];
    
    // Outback 32.814401,-80.025895 1890 Sam Rittenberg Boulevard
    location = [locationArray objectAtIndex:2];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
    [_mapView addAnnotation:annotation];
    
    // Outback 32.825942,-79.880326 715 Johnnie Dodds Boulevard
    location = [locationArray objectAtIndex:3];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
    [_mapView addAnnotation:annotation];
    
    // Page's (32.791189,-79.877175) Okra Grill 302 Coleman Boulevard
    location = [locationArray objectAtIndex:4];
    annotation = [[LocationAnnotation alloc] initWithLocation:location];
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

#pragma mark - beacon delegate methods

-(void)didEnterRegion:(CLRegion *)region{
    [self.view setBackgroundColor:[UIColor orangeColor]];
    NSLog(@"skoooo");
    UILocalNotification *notif = [[UILocalNotification alloc] init];
    notif.repeatInterval    = 0;
    notif.alertBody         = @"Found a great deal";
    notif.soundName         = @"sound.caf";
    notif.alertAction       = @"Take a look!";
    notif.userInfo = @{@"":@""};
    [[UIApplication sharedApplication] presentLocalNotificationNow:notif];
}

-(void)didFindBeacons:(NSArray *)beacons{
    NSLog(@"Did find beacons %i",[beacons count]);
}

@end
