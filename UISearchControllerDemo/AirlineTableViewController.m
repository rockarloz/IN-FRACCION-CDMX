//
//  AirlineTableViewController.m
//
//  Created by Carlos Castellanos.
//  Copyright (c) 2015 @rockarloz. All rights reserved.
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
-(void) downloadData{
    //download the file in a seperate thread.
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Downloading Started");
        NSString *urlToDownload = @"http://201.144.220.174/infracciones/api/personal/acreditado";
        NSURL  *url = [NSURL URLWithString:urlToDownload];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        if ( urlData )
        {
            NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString  *documentsDirectory = [paths objectAtIndex:0];
            
            NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"policias.json"];
            
            //saving is done on main thread
            
             dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [urlData writeToFile:filePath atomically:YES];
                NSLog(@"File Saved !");
                 UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Mensaje" message:@"Lista Actualizada" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                 [a show];
                [self search];
            });
        }
        
    });
    
}
-(void)UpdateData{
    [self downloadData];
}

-(void)search{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"policias.json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSMutableArray *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    self.airlines = dict;
    
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
    self.searchController.searchBar.barTintColor = [UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    self.searchController.searchBar.backgroundColor = [UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    self.searchController.searchBar.tintColor= [UIColor whiteColor];
      self.searchController.searchBar.tintColor=[UIColor whiteColor];
    self.searchController.delegate=self;
    self.tableView.tableHeaderView = self.searchController.searchBar;


}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    // Here write the code to push to new view controller
    return NO;
}
- (void)viewDidLoad {
    [self search];

    UIButton *search =  [UIButton buttonWithType:UIButtonTypeCustom];
     search.tintColor=[UIColor whiteColor];
    [search setImage:[UIImage imageNamed:@"Refresh_icon.png"] forState:UIControlStateNormal];
    [search addTarget:self action:@selector(UpdateData) forControlEvents:UIControlEventTouchUpInside];
    
    [search setFrame:CGRectMake(0, 0, 30 , 30)];
    UIBarButtonItem *buscar = [[UIBarButtonItem alloc]initWithCustomView:search];
    NSMutableArray *button=[[NSMutableArray alloc]initWithObjects:buscar, nil];
    self.navigationController.topViewController.navigationItem.rightBarButtonItems = button;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* foofile = [documentsDirectory stringByAppendingPathComponent:@"policias.json"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:foofile];
    [self loadData];
    if (fileExists) {
        NSFileManager *fm = [NSFileManager defaultManager];
        
        // OS X 10.5+
        NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
        NSString *path1 = [documentsDirectory1 stringByAppendingPathComponent:@"policias.json"];
        
        NSLog(@"%@", [[fm attributesOfItemAtPath:path1 error:NULL] fileModificationDate]);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-YYYY"];
        NSDate *todaysDate;
        todaysDate = [[fm attributesOfItemAtPath:path1 error:NULL] fileModificationDate];
        NSLog(@"Todays date is %@",[formatter stringFromDate:todaysDate]);
        
        
        [fm setAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate]
             ofItemAtPath:path1 error:NULL];
        
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd-MM-YYYY"];
        NSString *dateString = [dateFormat stringFromDate:today];
        NSLog(@"date: %@", dateString);
        
        if ([dateString isEqualToString:[formatter stringFromDate:todaysDate]]) {
            NSLog(@"Hoy fue su ultima actualizacion ");
        }
        else {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Mensaje" message:[NSString stringWithFormat:@"La lista se actualizó por última vez en %@ , te sugerimos actualizarla  nuevamente.",[formatter stringFromDate:todaysDate]] delegate:self cancelButtonTitle:@"Actualizar Ahora" otherButtonTitles:@"Actualizar después", nil];
        [a show];
        }

    }else
    {
    UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Mensaje" message:@"Hay una nueva lista actualizada, se iniciará la descarga automáticamente" delegate:self cancelButtonTitle:@"Actualizar Ahora" otherButtonTitles:nil, nil];
    [a show];
    }

    }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Actualizar Ahora"])
    {
        [self downloadData];
    }
    else if([title isEqualToString:@"Aceptar"])
    {
        NSLog(@"Button 2 was selected.");
    }
    else if([title isEqualToString:@"Actualizar después"])
    {
        NSLog(@"Button 3 was selected.");
    }}
-(void)loadData{


    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"policias" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSMutableArray *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    self.airlines = dict;
    
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
    cell.nombre.text = [[[self.airlines objectAtIndex:indexPath.row] objectForKey:@"nombre_completo"] capitalizedString];
    cell.nombre.numberOfLines=2;
    [cell.nombre sizeToFit ];
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
            if ([airline[@"nombre_completo"] containsString:airlineName] || [airline[@"placa"] containsString:airlineName]) {
                NSMutableDictionary *data=[[NSMutableDictionary alloc]init];
                NSString *str = [NSString stringWithFormat:@"%@", airline[@"nombre_completo"] /*, airline[@"icao"]*/];
                NSString *plt = [NSString stringWithFormat:@"%@", airline[@"placa"] /*, airline[@"icao"]*/];
                [data setObject:str forKey:@"name"];
                [data setObject:plt forKey:@"plate"];
                [searchResults addObject:data];
            }
            
            self.searchResults = searchResults;
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DescriptionViewController *des=[[DescriptionViewController alloc]init];
    des.name=[[self.airlines objectAtIndex:indexPath.row] objectForKey:@"nombre_completo"];
    des.plate = [NSString stringWithFormat:@"Placa:%@",[[self.airlines objectAtIndex:indexPath.row] objectForKey:@"placa"] ];
    [self.navigationController pushViewController:des animated:NO];
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.topViewController.navigationItem.title=@"Agentes";
    self.navigationController.navigationBar.backItem.title=@"";
}


@end
