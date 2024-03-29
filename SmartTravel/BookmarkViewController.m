//
//  BookmarkViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "BookmarkManager.h"
#import "BookmarkViewController.h"
#import "SearchCell.h"
#import "MockData.h"
#import "ImageHandler.h"
#import "BusinessDetailsViewController.h"

@interface BookmarkViewController ()
@property (nonatomic, strong) IBOutlet UILabel *noBookmarksLabel;
@property (weak, nonatomic) IBOutlet UITableView *bookmarkTable;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) Location *selectedLocation;
@end

@implementation BookmarkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([BookmarkManager bookmarkCount] <= 0)
    {
        [_noBookmarksLabel setHidden:FALSE];
        [_noBookmarksLabel setTextColor:[UIColor blackColor]];
        [_noBookmarksLabel setAlpha:0.5f];
        [_bookmarkTable setHidden:TRUE];
    }
    else
    {
        [_bookmarkTable reloadData];
        [_bookmarkTable setHidden:FALSE];
        [_noBookmarksLabel setHidden:TRUE];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    self.backgroundImage.image = [ImageHandler getMapImage];
    [self.bookmarkTable setBackgroundColor:[UIColor clearColor]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Location *location = [BookmarkManager bookmarkAtIndex:[indexPath row]];
    SearchCell *locationCell = [self.bookmarkTable dequeueReusableCellWithIdentifier:@"bookmarkCell"];
    [locationCell setBackgroundColor:[UIColor clearColor]];
    locationCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    locationCell.businessnameLabel.text = location.name;
    locationCell.locationLabel.text = location.address;
    locationCell.businessImage.image = [UIImage imageNamed:location.logo];
    
    UISwipeGestureRecognizer * Swipeleft= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    Swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [locationCell addGestureRecognizer:Swipeleft];
    
    return locationCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [BookmarkManager bookmarkCount];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedLocation = [BookmarkManager bookmarkAtIndex:[indexPath row]];
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"showDetails"]) {
        
        BusinessDetailsViewController *bdvc = [segue destinationViewController];
        
        bdvc.businessAddress = self.selectedLocation.address;
        bdvc.businessNameText = self.selectedLocation.name;
        bdvc.businessDealText = self.selectedLocation.dealText;
        bdvc.businessImage = [UIImage imageNamed:self.selectedLocation.image];
    }
}

- (void)swipeLeft:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
    NSIndexPath *indexPath = [_bookmarkTable indexPathForCell:sender];
    
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
    
    [_bookmarkTable beginUpdates];
    [_bookmarkTable deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    [_bookmarkTable endUpdates];
    }
}

@end