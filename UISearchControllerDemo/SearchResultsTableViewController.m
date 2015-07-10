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
#import "DescriptionViewController.h"
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DescriptionViewController *des=[[DescriptionViewController alloc]init];
    des.name=[[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"name"];
    des.plate = [NSString stringWithFormat:@"Placa:%@",[[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"plate"] ];
    des.from=@"search";
    // debo de hacer un nuevo navigation controller
    
    UINavigationController *auxNav=[[UINavigationController alloc]initWithRootViewController:des];
    
   // UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
 //[self.navigationController pushViewController:des  animated:NO];
    
    [self presentViewController:auxNav animated:NO completion:nil];
}

@end
