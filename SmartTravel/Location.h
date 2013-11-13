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
@property (nonatomic, readonly) NSString *logo;
@property (nonatomic, readonly) NSString *dealText;
@property (readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name andAddress:(NSString*)address andImage:(NSString*)image andLogo:(NSString *)logo andDealText:(NSString*)dealText andCoordinate:(CLLocationCoordinate2D)coordinate;

@end