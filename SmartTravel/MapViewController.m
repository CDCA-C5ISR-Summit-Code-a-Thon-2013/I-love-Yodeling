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
#import "ImageHandler.h"
#import "BusinessDetailsViewController.h"
#import "Location.h"

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

- (void)viewDidDisappear:(BOOL)animated
{
    // snapshot
    MockData *mockData = [[MockData alloc] init];
    [ImageHandler storeMapImage:[mockData blurSnapshotLightEffect:self]];
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
    
    // add every location within our mock data set to our map
    for (int i = 0; i < [locationArray count]; i++)
    {
        location = [locationArray objectAtIndex:i];
        annotation = [[LocationAnnotation alloc] initWithLocation:location];
        [_mapView addAnnotation:annotation];
    }
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
    CLBeacon *closestBeacon = [beacons firstObject];
    
    if (closestBeacon.proximity == CLProximityNear || closestBeacon.proximity == CLProximityImmediate) {
        [self performSegueWithIdentifier:@"showDetails" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showDetails"]) {
        BusinessDetailsViewController *bdvc = [segue destinationViewController];
        MockData *mockData = [[MockData alloc] init];
        NSArray *data = [mockData getLocationData];
        Location *location = data[0];
        bdvc.businessAddress = location.address;
        bdvc.businessNameText = location.name;
        bdvc.businessDealText = location.dealText;
        bdvc.businessImage = [UIImage imageNamed:location.image];
    }
}


@end
