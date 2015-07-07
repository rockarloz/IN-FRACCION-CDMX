//
//  SearchResults2TableViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 15/06/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "SearchResults2TableViewController.h"
#import "ConceptsTableViewCell.h"
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
    static NSString *CellIdentifier = @"Cell";
    ConceptsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ConceptsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.concepto.text = [[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"descripcion"];
    cell.concepto.numberOfLines=15;
    [cell.concepto sizeToFit];
    cell.concepto.frame=CGRectMake(10, 10, self.view.frame.size.width-20, cell.concepto.frame.size.height);
    
    cell.monto.frame=CGRectMake(cell.monto.frame.origin.x, cell.concepto.frame.size.height +cell.concepto.frame.origin.y+10, cell.monto.frame.size.width, cell.concepto.frame.size.height);
    cell.monto.text=[NSString stringWithFormat:@"Monto: $%f", [[[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"dias_sansion"] integerValue] *69.90];
    [cell.monto sizeToFit];
    
    cell.corralon.frame=CGRectMake(cell.corralon.frame.origin.x, cell.monto.frame.size.height +cell.monto.frame.origin.y+10, cell.corralon.frame.size.width, cell.corralon.frame.size.height);
    if ([[[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"corralon"] isEqualToString:@""]) {
        cell.corralon.text=@"Amerita corralón: NO";
    }
    else
        cell.corralon.text=[NSString stringWithFormat:@"Amerita corralón: %@", [[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"corralon"]];
    
    [cell.corralon sizeToFit];
    
    return cell;
   // cell.textLabel.text =[self.searchResults[indexPath.row]objectForKey:@"descripcion"];
    ///cell.placa.text = [self.searchResults[indexPath.row]objectForKey:@"plate"];
  
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get the text for indexPath
    // CGSize size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    //return size.height;
    //return UITableViewAutomaticDimension;
    NSString* text=[[_searchResults objectAtIndex:indexPath.row]objectForKey:@"descripcion"];
    CGSize constraint = CGSizeMake(300 - (10 * 2), 20000.0f);
    // remember change this method for ios  8 :D :P
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:constraint lineBreakMode: NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    
    
    return height + (10 * 14.5);
}


@end
