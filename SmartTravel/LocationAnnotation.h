//
//  LocationAnnotation.h
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface LocationAnnotation : NSObject <MKAnnotation>
{
    NSString *_name;
    NSString *_address;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate andName:(NSString*)name andAddress:(NSString*)address;

@end