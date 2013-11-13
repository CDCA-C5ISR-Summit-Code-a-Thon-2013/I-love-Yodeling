//
//  BookmarkManager.m
//  SmartTravel
//
//  Created by Will Goss on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "BookmarkManager.h"

@implementation BookmarkManager

static NSMutableArray *_bookmarks;

+ (void)init
{
    if (_bookmarks == nil)
    {
        _bookmarks = [[NSMutableArray alloc] init];
    }
}

+ (void)addBookmark:(Location*)location
{
    [BookmarkManager init];
    
    [_bookmarks addObject:location];
}

+ (void)removeBookmark:(Location*)location
{
    [BookmarkManager init];
    
    int index = [BookmarkManager indexOfBookmark:location];
    if (index != -1)
    {
        [_bookmarks removeObjectAtIndex:index];
    }
}

+ (int)bookmarkCount
{
    [BookmarkManager init];
    
    return _bookmarks.count;
}

+ (Location*)bookmarkAtIndex:(int)index
{
    [BookmarkManager init];
    
    if ((index >= -1) && (index < [_bookmarks count]))
    {
        return [_bookmarks objectAtIndex:index];
    }
    
    return nil;
}

+ (int)indexOfBookmark:(Location*)location
{
    [BookmarkManager init];
    
    for (int i = 0; i < [_bookmarks count]; i++)
    {
        Location *tempLocation = [_bookmarks objectAtIndex:i];
        if ((tempLocation.coordinate.latitude == location.coordinate.latitude) && (tempLocation.coordinate.longitude == location.coordinate.longitude))
        {
            return i;
        }
    }
    
    return -1;
}

+ (BOOL)isLocationBookmarked:(Location*)location
{
    [BookmarkManager init];
    
    for (int i = 0; i < [_bookmarks count]; i++)
    {
        Location *tempLocation = [_bookmarks objectAtIndex:i];
        if ((tempLocation.coordinate.latitude == location.coordinate.latitude) && (tempLocation.coordinate.longitude == location.coordinate.longitude))
        {
            return TRUE;
        }
    }
    
    return FALSE;
}

@end