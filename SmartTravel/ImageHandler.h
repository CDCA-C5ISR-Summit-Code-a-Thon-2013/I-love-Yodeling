//
//  ImageHandler.h
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageHandler : NSObject

+ (void)storeMapImage:(UIImage*)image;
+ (UIImage*)getMapImage;

@end