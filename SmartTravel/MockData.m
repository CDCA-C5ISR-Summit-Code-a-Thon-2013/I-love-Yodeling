//
//  MockData.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "MockData.h"

@implementation MockData

- (NSArray*) getLocationData
{
    NSMutableArray *locationArray = [[NSMutableArray alloc] init];
    
    // Applebee's 4910 Ashley Phosphate Road
    [locationArray addObject:[[Location alloc] initWithName:@"Applebee's" andAddress:@"4910 Ashley Phosphate Road" andImage:@"" andDealText:@"Every Veterans Day, Applebee's invites vets and active duty military to come have a meal on us. It's our way of saying thanks for their service. But, really, every day is an opportunity to say thank you. So, join us in our Thank You Movement to personally show your gratitude for those who have served, or are currently serving, in our military." andCoordinate:CLLocationCoordinate2DMake(32.918088, -80.103746)]];
    
    // Outback 32.95452,-80.038254 7643 Rivers Avenue
    [locationArray addObject:[[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"7643 Rivers Avenue" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.95452, -80.038254)]];
    
    // Outback 32.814401,-80.025895 1890 Sam Rittenberg Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"1890 Sam Rittenberg Boulevard" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.814401, -80.025895)]];
    
    // Outback 32.825942,-79.880326 715 Johnnie Dodds Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"715 Johnnie Dodds Boulevard" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.825942, -79.880326)]];
    
    // Page's (32.791189,-79.877175) Okra Grill 302 Coleman Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Page's Okra Grill" andAddress:@"302 Coleman Boulevard" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.791189, -79.877175)]];
    
    return locationArray;
}

- (NSArray *) loadMockData {
    
    NSArray *locationArray = [self getLocationData];
    
    Bookmark *location1 = [[Bookmark alloc] init];
    location1.location = [locationArray objectAtIndex:0];
    
    Bookmark *location2 = [[Bookmark alloc] init];
    location2.location = [locationArray objectAtIndex:1];
    
    Bookmark *location3 = [[Bookmark alloc] init];
    location3.location = [locationArray objectAtIndex:2];
    
    Bookmark *location4 = [[Bookmark alloc] init];
    location4.location = [locationArray objectAtIndex:3];
    
    Bookmark *location5 = [[Bookmark alloc] init];
    location5.location = [locationArray objectAtIndex:4];
    
//    Bookmark *location6 = [[Bookmark alloc] init];
//    location6.location = [locationArray objectAtIndex:0];
//    
//    Bookmark *location7 = [[Bookmark alloc] init];
//    location7.businessname = @"Test";
//    location7.dealText = @"Test again";
//    
//    Bookmark *location8 = [[Bookmark alloc] init];
//    location8.businessname = @"Test";
//    location8.dealText = @"Test again";
    
    // Sample Data
    NSArray *mediaArray = [[NSMutableArray alloc] initWithObjects:
                           location1, location2, location3, location4, location5, nil];
    
    return mediaArray;
}

@end
