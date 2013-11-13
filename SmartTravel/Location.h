//
//  Location.h
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) NSString *image;
@property (readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name andAddress:(NSString*)address andCoordinate:(CLLocationCoordinate2D)coordinate;

@end