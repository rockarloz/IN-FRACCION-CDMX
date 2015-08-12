//
//  ConceptDescriptionViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 11/08/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ConceptDescriptionViewController.h"

@interface ConceptDescriptionViewController ()

@end

@implementation ConceptDescriptionViewController
@synthesize description,article,corralon,points,price;
- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    [self CreateElements];
    // Do any additional setup after loading the view.
}
-(void)CreateElements{
    description=[[UILabel alloc]initWithFrame:CGRectMake(15, 90, self.view.frame.size.width-30, 50)];
    description.numberOfLines=15;
    description.text =[[_data objectForKey:@"descripcion"]capitalizedString];
    [description setFont:[UIFont fontWithName:@"OpenSans-Bold" size:17]];
    [description sizeToFit];
    [self.view addSubview:description];

    article=[[UILabel alloc]initWithFrame:CGRectMake(15, description.frame.size.height+description.frame.origin.y+10, self.view.frame.size.width-30, 50)];
    article.text=[NSString stringWithFormat:@"Artículo %@ fracción %@",[_data objectForKey:@"articulo"],[_data objectForKey:@"fraccion"]];
    [article setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:14]];
    article.textColor=[UIColor darkGrayColor];
    [article sizeToFit];
    [self.view addSubview:article];

    corralon=[[UILabel alloc]initWithFrame:CGRectMake(15, article.frame.size.height+article.frame.origin.y+10, self.view.frame.size.width-30, 50)];
    if ([[_data objectForKey:@"corralon"] isEqualToString:@""]) {
        corralon.text=@"Corralón: NO";
    }
    else
        corralon.text=[NSString stringWithFormat:@"Corralón: %@", [_data objectForKey:@"corralon"]];     [self.view addSubview:corralon];
    [corralon setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:14]];
    corralon.textColor=[UIColor darkGrayColor];
    [corralon sizeToFit];
    [self.view addSubview:corralon];
    
     points=[[UILabel alloc]initWithFrame:CGRectMake(15, corralon.frame.size.height+corralon.frame.origin.y+10, self.view.frame.size.width-30, 50)];
    points.text =[NSString stringWithFormat:@"%@ punto(s) de licencia",[_data objectForKey:@"puntos"]];
    [points setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:14]];
    [points sizeToFit];
    points.textColor=[UIColor darkGrayColor];
    [self.view addSubview:points];
    
    price=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-15, points.frame.size.height+points.frame.origin.y+5, self.view.frame.size.width-60, 50)];
    price.text =[NSString stringWithFormat:@"$%0.2f", [[_data objectForKey:@"dias_sansion"] integerValue] *69.90];
    
    [price setFont:[UIFont fontWithName:@"OpenSans-Bold" size:19]];
    [price sizeToFit];
    price.frame=CGRectMake(self.view.frame.size.width-price.frame.size.width-15, price.frame.origin.y, price.frame.size.width, price.frame.size.height);
    price.textColor=[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    [self.view addSubview:price];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.topViewController.navigationItem.title=@"Detalles";
    self.navigationController.navigationBar.backItem.title=@"";
    
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [ self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1]];
    
    
    [[[ self navigationController] navigationBar] setBarStyle:UIBarStyleBlackTranslucent];
    
    if ([_from isEqualToString:@"search"]) {
        
        UIButton *search =  [UIButton buttonWithType:UIButtonTypeCustom];
        search.tintColor=[UIColor whiteColor];
        [search setImage:[UIImage imageNamed:@"atras.png"] forState:UIControlStateNormal];
        [search addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [search setFrame:CGRectMake(0, 0, 30 , 30)];
        UIBarButtonItem *buscar = [[UIBarButtonItem alloc]initWithCustomView:search];
        NSMutableArray *button=[[NSMutableArray alloc]initWithObjects:buscar, nil];
        self.navigationController.topViewController.navigationItem.leftBarButtonItems = button;
    }
    
}


-(void)back{
    
    [self dismissViewControllerAnimated:NO completion:nil];
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
