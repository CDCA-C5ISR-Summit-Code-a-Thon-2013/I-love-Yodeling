//
//  Location.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "Location.h"

@implementation Location

- (id)initWithName:(NSString*)name andAddress:(NSString*)address andCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    _name = name;
    _address = address;
    _coordinate = coordinate;
    return self;
}

@end
