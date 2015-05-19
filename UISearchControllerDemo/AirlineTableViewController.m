//
//  AirlineTableViewController.m
//  UISearchControllerDemo
//
//  Created by Jason Hoffman on 1/13/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "AirlineTableViewController.h"
#import "AgenteTableViewCell.h"
#import "SearchResultsTableViewController.h"
#import "DescriptionViewController.h"

@interface AirlineTableViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) NSArray *airlines;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation AirlineTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Get local json file we'll be using to populate our TableView
    NSString *path = [[NSBundle mainBundle] pathForResource:@"policias_infraccion" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    self.airlines = dict[@"policias"];
    
    // There's no transition in our storyboard to our search results tableview or navigation controller
    // so we'll have to grab it using the instantiateViewControllerWithIdentifier: method
    UINavigationController *searchResultsController = [[self storyboard] instantiateViewControllerWithIdentifier:@"TableSearchResultsNavController"];
    
    // Our instance of UISearchController will use searchResults
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    // The searchcontroller's searchResultsUpdater property will contain our tableView.
    self.searchController.searchResultsUpdater = self;
    
    // The searchBar contained in XCode's storyboard is a leftover from UISearchDisplayController.
    // Don't use this. Instead, we'll create the searchBar programatically.
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,
                                                       self.searchController.searchBar.frame.origin.y,
                                                       self.searchController.searchBar.frame.size.width, 44.0);
    self.searchController.searchBar.placeholder=@"Busca el nombre o placa de un agente";
    self.searchController.searchBar.barTintColor = [UIColor redColor];
    self.searchController.searchBar.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.airlines count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AgenteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Airline" forIndexPath:indexPath];
    cell.nombre.text = [[self.airlines objectAtIndex:indexPath.row] objectForKey:@"nombre"];
    cell.placa.text = [NSString stringWithFormat:@"Placa:%@",[[self.airlines objectAtIndex:indexPath.row] objectForKey:@"placa"] ];
    
    return cell;
}


#pragma mark - UISearchControllerDelegate & UISearchResultsDelegate

// Se llama para presentar los resultados
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
    // Set searchString equal to what's typed into the searchbar
    NSString *searchString = [self.searchController.searchBar.text uppercaseString];
    
    
    [self updateFilteredContentForAirlineName:searchString];
    
    // If searchResultsController
    if (self.searchController.searchResultsController) {
        
        UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
        
        // Present SearchResultsTableViewController as the topViewController
        SearchResultsTableViewController *vc = (SearchResultsTableViewController *)navController.topViewController;
        
        // Update searchResults
        vc.searchResults = self.searchResults;
        
        // And reload the tableView with the new data
        [vc.tableView reloadData];
    }
}


// Update self.searchResults based on searchString, which is the argument in passed to this method
- (void)updateFilteredContentForAirlineName:(NSString *)airlineName
{
    
    if (airlineName == nil) {
        
        // If empty the search results are the same as the original data
        self.searchResults = [self.airlines mutableCopy];
    } else {
        
        NSMutableArray *searchResults = [[NSMutableArray alloc] init];
        
        // Else if the airline's name is
        for (NSDictionary *airline in self.airlines) {
            if ([airline[@"nombre"] containsString:airlineName] || [airline[@"placa"] containsString:airlineName]) {
                
                NSString *str = [NSString stringWithFormat:@"%@", airline[@"nombre"] /*, airline[@"icao"]*/];
                [searchResults addObject:str];
            }
            
            self.searchResults = searchResults;
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DescriptionViewController *des=[[DescriptionViewController alloc]init];
    [self.navigationController pushViewController:des animated:NO];
   
}




@end
