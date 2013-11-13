//
//  BeaconManager.m
//  SmartTravel
//
//  Created by Bobby Strickland on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "BeaconManager.h"

@interface BeaconManager ()

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation BeaconManager

- (id)initWithUUID:(NSString*)proxUuid identifier:(NSString*)identifier {
    self = [super init];
    if (self){
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:proxUuid];
        self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:identifier];
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    return self;
}

-(void)startBeaconRanging{
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    if (![self.beaconRegion isEqual:region]) return;
        
    if([_delegate respondsToSelector:@selector(didEnterRegion:)]){
        [_delegate didEnterRegion:region];
    }
    
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    if ([_delegate respondsToSelector:@selector(didFindBeacons:)]) {
        [_delegate didFindBeacons:beacons];
    }
}


- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}


@end
