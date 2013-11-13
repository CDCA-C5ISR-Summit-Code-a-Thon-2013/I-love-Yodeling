//
//  SearchViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"
#import "SearchBarCell.h"
#import "Bookmark.h"
#import "MockData.h"

@interface SearchViewController ()

@property (retain) NSArray *filteredDataArray;
@property (retain) NSArray *mockDataArray;

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
    
    self.filteredDataArray = [[NSMutableArray alloc] init];
    
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
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    } else {
        return [self.mockDataArray count];
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        static NSString *CellIdentifier = @"searchBarCell";
        
        SearchBarCell *cell = [self.searchTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if ( cell == nil ) {
            cell = [[SearchBarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.backgroundColor = [UIColor purpleColor];
        
        return cell;
        
    } else {
        
        static NSString *CellIdentifier = @"searchCell";
        
        SearchCell *cell = [self.searchTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if ( cell == nil ) {
            cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.backgroundColor = [UIColor cyanColor];
        
        Bookmark *bookmark = nil;
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            //If the user is searching, use the list in our filteredList array.
            bookmark = [self.filteredDataArray objectAtIndex:indexPath.row];
        } else {
            bookmark= [self.mockDataArray objectAtIndex:indexPath.row];
        }
        
        cell.businessnameLabel.text = bookmark.location.name;
        cell.dealLabel.text = bookmark.location.address;
        cell.businessImage.backgroundColor = [UIColor blackColor];
        cell.businessImage.image = [UIImage imageNamed:bookmark.location.image];
        
        return cell;
    }
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

}


# pragma mark - filter methods

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    
}

@end
