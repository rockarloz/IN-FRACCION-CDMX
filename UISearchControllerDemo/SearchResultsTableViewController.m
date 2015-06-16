//
//  SearchResultsTableViewController.m
//  UISearchControllerDemo
//
//
//  Created by Carlos Castellanos.
//  Copyright (c) 2015 @rockarloz. All rights reserved.
//


#import "SearchResultsTableViewController.h"
#import "AgenteTableViewCell.h"
@interface SearchResultsTableViewController ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation SearchResultsTableViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
    return [self.searchResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AgenteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultCell" forIndexPath:indexPath];
    
    cell.nombre.text = [self.searchResults[indexPath.row]objectForKey:@"name"];
     cell.placa.text = [self.searchResults[indexPath.row]objectForKey:@"plate"];
    
    return cell;
}


@end
