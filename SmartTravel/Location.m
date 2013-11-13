//
//  Location.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "Location.h"

@implementation Location

- (id)initWithName:(NSString*)name andAddress:(NSString*)address andImage:(NSString*)image andLogo:(NSString *)logo andDealText:(NSString*)dealText andCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    _name = name;
    _address = address;
    _coordinate = coordinate;
    _image = image;
    _logo = logo;
    _dealText = dealText;
    return self;
}

@end
