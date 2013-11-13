//
//  MapViewController.h
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeaconManager.h"

@interface MapViewController : UIViewController <MKMapViewDelegate,BeaconTrackingManagerDelegate>

@end
