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

@interface BookmarkViewController ()
@property (weak, nonatomic) IBOutlet UITableView *bookmarkTable;
@property (strong, nonatomic) NSMutableArray *bookmarks;
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
	// Do any additional setup after loading the view.
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
    bookmarkCell.businessnameLabel.text = bookmark.businessname;
    bookmarkCell.dealLabel.text = bookmark.dealText;
    return bookmarkCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


@end
