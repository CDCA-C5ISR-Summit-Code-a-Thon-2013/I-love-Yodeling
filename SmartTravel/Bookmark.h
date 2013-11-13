//
//  Bookmark.h
//  SmartTravel
//
//  Created by Bobby Strickland on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface Bookmark : NSObject

//@property (strong, nonatomic) NSString *businessImagePath;
//@property (strong, nonatomic) NSString *businessname;
//@property (strong, nonatomic) NSString *dealText;

@property (nonatomic, strong) Location *location;

@end
