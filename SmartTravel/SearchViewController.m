//
//  SearchViewController.m
//  SmartTravel
//
//  Created by Adam C. Smith on 11/13/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"
#import "Location.h"
#import "MockData.h"
#import "ImageHandler.h"

@interface SearchViewController ()

@property (strong, nonatomic) IBOutlet UIView *searchBarView;
@property (retain) NSArray *mockDataArray;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *searchViewLabel;

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
    self.mockDataArray = [mockme getLocationData];
    
    self.searchTableView.hidden = YES;
    [self.searchBar setDelegate:self];
    self.searchTableView.backgroundColor = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.searchViewLabel.textColor = [UIColor blueColor];
    self.searchViewLabel.alpha = .5;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self.searchTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    self.backgroundImageView.image = [ImageHandler getMapImage];
    
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
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        cell.backgroundColor = [UIColor clearColor];
        
        Location *location = [self.mockDataArray objectAtIndex:indexPath.row];
        
        cell.businessnameLabel.text = location.name;
        cell.businessnameLabel.textColor = [UIColor blueColor];
        cell.businessnameLabel.alpha = .5;
    
        cell.locationLabel.text = location.address;
        cell.locationLabel.textColor = [UIColor blueColor];
        cell.locationLabel.alpha = .5;
    
        cell.businessImage.backgroundColor = [UIColor blackColor];
//        cell.businessImage.image = [UIImage imageNamed:bookmark.location.image];
    
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
    
    if ([searchBar.text isEqual: @"29412"] ||
        [searchBar.text isEqual: @"29464"] ||
        [searchBar.text isEqual: @"29466"] ||
        [searchBar.text isEqual: @"29407"] ||
        [searchBar.text isEqual: @"29405"] ) {
        
        [self.searchTableView reloadData];
        self.searchViewLabel.hidden = YES;
        self.searchTableView.hidden = NO;
        
    } else {
        
        self.searchTableView.hidden = YES;
        self.searchViewLabel.hidden = NO;
        self.searchViewLabel.text = @"Sorry!  No deals found in this area :(";
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void) dismissKeyboard
{
    // add self
    [self.searchBar resignFirstResponder];
}

@end
