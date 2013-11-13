//
//  LocationAnnotation.h
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "Location.h"
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface LocationAnnotation : NSObject <MKAnnotation>
{
    NSString *_name;
    NSString *_address;
}

@property (nonatomic, readonly) Location* location;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

- (id)initWithLocation:(Location*)location;

@end