//
//  ImageHandler.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "ImageHandler.h"

@implementation ImageHandler

static UIImage *_mapImage;

+ (void)storeMapImage:(UIImage*)image
{
    _mapImage = image;
}

+ (UIImage*)getMapImage
{
    return _mapImage;
}

@end