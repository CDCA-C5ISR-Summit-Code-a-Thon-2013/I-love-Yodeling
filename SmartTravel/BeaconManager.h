//
//  BeaconManager.h
//  SmartTravel
//
//  Created by Bobby Strickland on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol BeaconTrackingManagerDelegate <NSObject>

@required
- (void)didFindBeacons:(NSArray*)beacons;
- (void)didEnterRegion:(CLRegion*)region;
@end


@interface BeaconManager : NSObject<CLLocationManagerDelegate>{
    //delegate to respond back
    id <BeaconTrackingManagerDelegate> _delegate;
}

@property (nonatomic,strong) id delegate;

- (id)initWithUUID:(NSString*)proxUuid identifier:(NSString*)identifier;

-(void)startBeaconRanging;

@end
