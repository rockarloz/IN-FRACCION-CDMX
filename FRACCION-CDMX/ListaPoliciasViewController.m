//
//  ListaPoliciasViewController.m
//  FRACCION-CDMX
//
//  Created by Carlos Castellanos on 08/03/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import "ListaPoliciasViewController.h"

@interface ListaPoliciasViewController ()

@end

@implementation ListaPoliciasViewController
{
    NSArray *destacados;    // El número de destacados que se descargaron 10 Max
    
    NSArray *principal;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self obtener];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)obtener{
    
    /***************************************/
    /*  Codigo para llamada a backend      */
    /***************************************/

    NSString *url =@"http://infracciones.herokuapp.com/infractions.json";
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        if ([data length] >0  )
        {
            
            
            NSString *dato=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            NSMutableString * miCadena =[NSMutableString stringWithString: dato];
            NSData *data1 = [miCadena dataUsingEncoding:NSUTF8StringEncoding];
            
            //voy a comentar las siguientes lineas ya que no se tiene llave princilpal
            // NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingAllowFragments error:nil];
            //destacados=[jsonObject objectForKey:@"destacados"];
            
            destacados=[NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingAllowFragments error:nil];
            principal=destacados;
            if ([principal count]!=0) {
                
                [_tabla reloadData];
            }
            else{
                UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Mensajes" message:@"Por el momento no podemos conectarnos al servidor intenta mas tarde" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                [a show];
                
            }
            
            
        }
        
        else{
            
        }
        
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return principal.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSMutableDictionary *a=[principal objectAtIndex:indexPath.row];
    [cell.textLabel setText: [a objectForKey:@"nombre"]];
    
    return cell;
}
#pragma mark - Table view Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // ContentViewController *content = [[ContentViewController alloc] init];
    
    // [self.navigationController pushViewController:content animated:YES];
    
    //[self presentViewController:content animated:YES completion:nil];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
