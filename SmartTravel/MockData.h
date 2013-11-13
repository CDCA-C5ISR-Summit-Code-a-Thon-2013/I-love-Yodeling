//
//  MockData.h
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bookmark.h"

@interface MockData : NSObject

- (NSArray*) getLocationData;
- (NSArray *) loadMockData;
- (UIImage *) blurSnapshotLightEffect : (UIViewController *) currentViewController

@end
