//
//  MockData.h
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockData : NSObject

- (NSArray*) getLocationData;
- (UIImage *) blurSnapshotLightEffect : (UIViewController *) currentViewController;
- (int)indexOfLocation:(Location*)location;
- (Location*)getLocationAtIndex:(int)index;

@end