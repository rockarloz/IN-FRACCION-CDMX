//
//  ConceptosTableViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 13/05/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ConceptosTableViewController.h"
#import "SearchResultsTableViewController.h"
#import <AFHTTPRequestOperationManager.h>

@interface ConceptosTableViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *conceptos;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation ConceptosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get local json file we'll be using to populate our TableView
    NSString *path = [[NSBundle mainBundle] pathForResource:@"policias_infraccion" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
   // self.conceptos = dict[@"policias"];
    
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
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.searchBar.placeholder=@"Busca tu infracción";
    self.searchController.searchBar.barTintColor =  [UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];

    self.searchController.searchBar.backgroundColor =  [UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];

    [self getData];
}
-(void)getData{
    _conceptos=[[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://infracciones.herokuapp.com/concepts.json" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        for (NSDictionary *item in responseObject) {
            [_conceptos addObject:item];
        }
      
        
        if ([_conceptos count]) {
            // Succes Get data :D
            [self.tableView reloadData];
            CGFloat heightAux=0;
            for (NSDictionary *content in _conceptos) {
                NSString* text=[content objectForKey:@"infraccion"];
                CGSize constraint = CGSizeMake(300 - (10 * 2), 20000.0f);
                // remember change this method for ios  8 :D :P
                
                CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14]      constrainedToSize:constraint lineBreakMode: NSLineBreakByWordWrapping];
                
                CGFloat height = MAX(size.height, 44.0f);
                
                
                
                height= height + (10 * 14.5);
                heightAux=heightAux+height;
                
            }
            
           
                   }
        
        else{
            // No Success
            //   NSLog(@"no hay ");
        }
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error %@", error);
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.conceptos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.conceptos objectAtIndex:indexPath.row] objectForKey:@"infraccion"];
    cell.textLabel.numberOfLines=15;
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
        self.searchResults = [self.conceptos mutableCopy];
    } else {
        
        NSMutableArray *searchResults = [[NSMutableArray alloc] init];
        
        // Else if the airline's name is
        for (NSDictionary *airline in self.conceptos) {
            if ([[airline[@"infraccion"]uppercaseString] containsString:airlineName] ) {
                
                NSString *str = [NSString stringWithFormat:@"%@", airline[@"infraccion"] /*, airline[@"icao"]*/];
                [searchResults addObject:str];
            }
            
            self.searchResults = searchResults;
        }
    }
}



- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get the text for indexPath
    // CGSize size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    //return size.height;
    //return UITableViewAutomaticDimension;
    NSString* text=[[_conceptos objectAtIndex:indexPath.row]objectForKey:@"infraccion"];
    CGSize constraint = CGSizeMake(300 - (10 * 2), 20000.0f);
    // remember change this method for ios  8 :D :P
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14]      constrainedToSize:constraint lineBreakMode: NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    
    
    return height + (10 * 14.5);
}






@end
