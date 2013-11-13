//
//  MockData.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "MockData.h"

@implementation MockData

- (NSArray *) loadMockData {
    
    Bookmark *location1 = [[Bookmark alloc] init];
    location1.businessname = @"Test";
    location1.dealText = @"Test again";
    
    Bookmark *location2 = [[Bookmark alloc] init];
    location2.businessname = @"Test";
    location2.dealText = @"Test again";
    
    Bookmark *location3 = [[Bookmark alloc] init];
    location3.businessname = @"Test";
    location3.dealText = @"Test again";
    
    Bookmark *location4 = [[Bookmark alloc] init];
    location4.businessname = @"Test";
    location4.dealText = @"Test again";
    
    Bookmark *location5 = [[Bookmark alloc] init];
    location5.businessname = @"Test";
    location5.dealText = @"Test again";
    
    Bookmark *location6 = [[Bookmark alloc] init];
    location6.businessname = @"Test";
    location6.dealText = @"Test again";
    
    Bookmark *location7 = [[Bookmark alloc] init];
    location7.businessname = @"Test";
    location7.dealText = @"Test again";
    
    Bookmark *location8 = [[Bookmark alloc] init];
    location8.businessname = @"Test";
    location8.dealText = @"Test again";
    
    // Sample Data
    NSArray *mediaArray = [[NSMutableArray alloc] initWithObjects:
                           location1, location2, location3, location4, location5,
                           location6, location7, location8, nil];
    
    return mediaArray;
}

@end
