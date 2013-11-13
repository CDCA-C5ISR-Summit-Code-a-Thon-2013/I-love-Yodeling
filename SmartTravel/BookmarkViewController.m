//
//  BookmarkViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "BookmarkViewController.h"
#import "SearchCell.h"
#import "Bookmark.h"
#import "MockData.h"

@interface BookmarkViewController ()
@property (weak, nonatomic) IBOutlet UITableView *bookmarkTable;
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
    
    if ([_bookmarks count] == 0) {
        
        MockData *mockme = [[MockData alloc] init];
        
        _bookmarks = [[NSMutableArray alloc] initWithArray:[mockme loadMockData]];
//        
//        [_bookmarks addObject:mark1];
//        [_bookmarks addObject:mark2];
        
        [self.bookmarkTable reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Bookmark *bookmark = [_bookmarks objectAtIndex:[indexPath row]];
    
    SearchCell *bookmarkCell = [self.bookmarkTable dequeueReusableCellWithIdentifier:@"bookmarkCell"];
    bookmarkCell.businessnameLabel.text = bookmark.location.name;
    bookmarkCell.dealLabel.text = bookmark.location.address;
    [bookmarkCell.businessImage setBackgroundColor:[UIColor blackColor]];
    return bookmarkCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_bookmarks count];
}


@end
