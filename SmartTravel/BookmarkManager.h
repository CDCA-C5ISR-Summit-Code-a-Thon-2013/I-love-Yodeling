//
//  BookmarkManager.h
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface BookmarkManager : NSObject

+ (void)addBookmark:(Location*)location;
+ (void)removeBookmark:(Location*)location;
+ (int)indexOfBookmark:(Location*)location;
+ (int)bookmarkCount;
+ (Location*)bookmarkAtIndex:(int)index;
+ (BOOL)isLocationBookmarked:(Location*)location;

@end
