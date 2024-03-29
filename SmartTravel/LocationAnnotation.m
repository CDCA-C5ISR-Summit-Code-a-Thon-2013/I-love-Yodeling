//
//  LocationAnnotation.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "LocationAnnotation.h"

@implementation LocationAnnotation

- (id)initWithLocation:(Location*)location
{
    self = [super init];
    _coordinate = location.coordinate;
    _location = location;
    _name = _location.name;
    _address = _location.address;
    _title = _name;
    _subtitle = _address;
    return self;
}

@end