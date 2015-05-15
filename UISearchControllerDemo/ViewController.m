//
//  ViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 11/05/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ViewController.h"
#import "AirlineTableViewController.h"
#import "ConceptosTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    
     UIButton* agentes = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [agentes addTarget:self
                 action:@selector(goToAgentes:)
       forControlEvents:UIControlEventTouchUpInside];
    [agentes setTitle:@"¿Te puede infraccionar?" forState:UIControlStateNormal];
    agentes.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:agentes];
    
    UIButton* conceptos = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [conceptos addTarget:self
                action:@selector(goToConcepts:)
      forControlEvents:UIControlEventTouchUpInside];
    [conceptos setTitle:@"revisa tu infraccion" forState:UIControlStateNormal];
    conceptos.frame = CGRectMake(80.0, 100.0, 160.0, 40.0);
    [self.view addSubview:conceptos];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)goToConcepts:(id)sender
{
    
    
    
    
    ConceptosTableViewController *list=[[ConceptosTableViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}
-(IBAction)goToAgentes:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   
    
    AirlineTableViewController *list=[storyboard instantiateViewControllerWithIdentifier:@"Airline"];    [self.navigationController pushViewController:list animated:YES];
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
