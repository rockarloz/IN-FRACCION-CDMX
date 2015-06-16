//
//  SearchResults2TableViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 15/06/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "SearchResults2TableViewController.h"

@interface SearchResults2TableViewController ()
@property (nonatomic, strong) NSArray *array;
@end

@implementation SearchResults2TableViewController


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.searchResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultCell" forIndexPath:indexPath];
    cell.textLabel.numberOfLines=15;
    cell.textLabel.text = self.searchResults[indexPath.row];
    ///cell.placa.text = [self.searchResults[indexPath.row]objectForKey:@"plate"];
    
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get the text for indexPath
    // CGSize size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    //return size.height;
    //return UITableViewAutomaticDimension;
    NSString* text=self.searchResults[indexPath.row];
    CGSize constraint = CGSizeMake(300 - (10 * 2), 20000.0f);
    // remember change this method for ios  8 :D :P
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14]      constrainedToSize:constraint lineBreakMode: NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    
    
    return height + (10 * 14.5);
}

@end
