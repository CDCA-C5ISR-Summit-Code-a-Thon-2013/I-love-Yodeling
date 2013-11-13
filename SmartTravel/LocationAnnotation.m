//
//  LocationAnnotation.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "LocationAnnotation.h"

@implementation LocationAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate andName:(NSString*)name andAddress:(NSString*)address
{
    self = [super init];
    _coordinate = coordinate;
    _name = name;
    _address = address;
    _title = _name;
    _subTitle = _address;
    return self;
}

@end