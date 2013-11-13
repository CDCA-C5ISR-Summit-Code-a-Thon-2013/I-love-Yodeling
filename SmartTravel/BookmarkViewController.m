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

@interface BookmarkViewController ()
@property (nonatomic, strong) IBOutlet UILabel *noBookmarksLabel;
@property (weak, nonatomic) IBOutlet UITableView *bookmarkTable;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;
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
        [_noBookmarksLabel setTextColor:[UIColor blueColor]];
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
    locationCell.businessnameLabel.text = location.name;
    locationCell.locationLabel.text = location.dealText;
    [locationCell.businessImage setBackgroundColor:[UIColor blackColor]];
    return locationCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [BookmarkManager bookmarkCount];
}

@end