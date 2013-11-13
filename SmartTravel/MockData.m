//
//  MockData.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "MockData.h"
#import "UIImage+ImageEffects.h"

@implementation MockData

- (NSArray*) getLocationData
{
    NSMutableArray *locationArray = [[NSMutableArray alloc] init];
    
    // Applebee's 4910 Ashley Phosphate Road
    [locationArray addObject:[[Location alloc] initWithName:@"Applebee's" andAddress:@"4910 Ashley Phosphate Road" andImage:@"" andDealText:@"Every Veterans Day, Applebee's invites vets and active duty military to come have a meal on us." andCoordinate:CLLocationCoordinate2DMake(32.918088, -80.103746)]];
    
    // Outback 32.95452,-80.038254 7643 Rivers Avenue
    [locationArray addObject:[[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"7643 Rivers Avenue" andImage:@"" andDealText:@"Active duty members of the military can enjoy a 20% discount on all items!" andCoordinate:CLLocationCoordinate2DMake(32.95452, -80.038254)]];
    
    // Outback 32.814401,-80.025895 1890 Sam Rittenberg Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"1890 Sam Rittenberg Boulevard" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.814401, -80.025895)]];
    
    // Outback 32.825942,-79.880326 715 Johnnie Dodds Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Outback Steakhouse" andAddress:@"715 Johnnie Dodds Boulevard" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.825942, -79.880326)]];
    
    // Page's (32.791189,-79.877175) Okra Grill 302 Coleman Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Page's Okra Grill" andAddress:@"302 Coleman Boulevard" andImage:@"" andDealText:@"20% off all entrees for veterans and active duty military." andCoordinate:CLLocationCoordinate2DMake(32.791189, -79.877175)]];
    
    // Market Pavilion Hotel
    [locationArray addObject:[[Location alloc] initWithName:@"Market Pavilion Hotel" andAddress:@"225 East Bay Street" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.781024, -79.927685)]];
    
    // The Mills House Hotel
    [locationArray addObject:[[Location alloc] initWithName:@"The Mills House Hotel" andAddress:@"115 Meeting Street" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.778002, -79.931762)]];
    
    // Holiday Inn Express Hotel 350 Johnnie Dodds Boulevard
    [locationArray addObject:[[Location alloc] initWithName:@"Holiday Inn Express Hotel" andAddress:@"350 Johnnie Dodds Boulevard" andImage:@"" andDealText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec nibh ac leo blandit vestibulum in quis turpis. Nunc convallis consectetur tortor eu sodales. Sed ut enim dolor. Vestibulum vitae sodales tellus. Cras vulputate odio vel feugiat eleifend. Duis in est quis erat dapibus pulvinar vel id tortor. Curabitur et porttitor ante, nec interdum lectus. Fusce a mauris et eros tristique ultrices nec non nisl." andCoordinate:CLLocationCoordinate2DMake(32.80478, -79.892934)]];
    
    // Gibbes Museum of Art
    [locationArray addObject:[[Location alloc] initWithName:@"Gibbes Museum of Art" andAddress:@"135 Meeting Street" andImage:@"" andDealText:@"Military rate of $7 ($2 savings)" andCoordinate:CLLocationCoordinate2DMake(32.778985, -79.931322)]];
    
    // Magnolia Plantation and Gardens
    [locationArray addObject:[[Location alloc] initWithName:@"Magnolia Plantation and Gardens" andAddress:@"3550 Ashley River Road" andImage:@"" andDealText:@"$1 off admissions" andCoordinate:CLLocationCoordinate2DMake(32.908793, -80.148559)]];
    
    // Yogi Bear’s Jellystone Park Camp Resorts
    [locationArray addObject:[[Location alloc] initWithName:@"Yogi Bear’s Jellystone Park Camp Resorts" andAddress:@"357 Cedar Creek Rd" andImage:@"" andDealText:@"10% off campsites for active military" andCoordinate:CLLocationCoordinate2DMake(33.373384, -79.658863)]];
    
    return locationArray;
}




- (UIImage *) blurSnapshotLightEffect : (UIViewController *) currentViewController {
    
    // create image context
    UIGraphicsBeginImageContextWithOptions(currentViewController.view.bounds.size, NO, 0);
    
    // render a snapshot of the view hierarchy into the current context
    [currentViewController.view drawViewHierarchyInRect:currentViewController.view.frame afterScreenUpdates:NO];
    
    // grabs snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // apply blur effect using apple code
    UIImage *blurredImage = [snapshotImage applyLightEffect];
    //    UIImage *blurredImage = [drakeImage applyExtraLightEffect];
    //    UIImage *blurredImage = [drakeImage applyTintEffectWithColor:[UIColor orangeColor]];
    
    // clean up
    UIGraphicsEndImageContext();
    
    return blurredImage;
}

@end
