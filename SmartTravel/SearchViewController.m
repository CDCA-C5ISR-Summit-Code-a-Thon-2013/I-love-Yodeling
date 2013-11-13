//
//  SearchViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"
//#import "SearchBarCell.h"
#import "Bookmark.h"
#import "MockData.h"

@interface SearchViewController ()

@property (strong, nonatomic) IBOutlet UIView *searchBarView;
@property (retain) NSArray *mockDataArray;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchViewController

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
    
    //load up mock data
    MockData *mockme = [[MockData alloc] init];
    self.mockDataArray = mockme.loadMockData;
    
    self.searchBarView.backgroundColor = [UIColor cyanColor];
    self.searchTableView.hidden = YES;
    [self.searchBar setDelegate:self];
    
    [self.searchDisplayController setDisplaysSearchBarInNavigationBar:YES];
    
    [self.searchTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - table view delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.mockDataArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        static NSString *CellIdentifier = @"searchCell";
        
        SearchCell *cell = [self.searchTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if ( cell == nil ) {
            cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.backgroundColor = [UIColor cyanColor];
        
        Bookmark *bookmark = [self.mockDataArray objectAtIndex:indexPath.row];
        
        cell.businessnameLabel.text = bookmark.businessname;
        cell.dealLabel.text = bookmark.dealText;
        cell.businessImage.backgroundColor = [UIColor blackColor];
//        cell.businessImage.image = [UIImage imageNamed:bookmark.businessImagePath];
        
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


# pragma mark - UISearchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller {
    
    [controller.searchResultsTableView setDelegate:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.searchBar resignFirstResponder];
    [self.searchTableView reloadData];
    self.searchTableView.hidden = NO;
}

@end
