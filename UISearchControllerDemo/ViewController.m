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
#import "AboutViewController.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)gotoAbout{
    AboutViewController *about=[[AboutViewController alloc]init];
    [self.navigationController pushViewController:about animated:YES];
}
- (void)viewDidLoad {
     [super viewDidLoad];
    
    UIButton *search =  [UIButton buttonWithType:UIButtonTypeInfoLight];
    //[search setImage:[UIImage imageNamed:@"df.png"] forState:UIControlStateNormal];
    [search addTarget:self action:@selector(gotoAbout) forControlEvents:UIControlEventTouchUpInside];
    
    [search setFrame:CGRectMake(0, 0, 25 , 25)];
    UIBarButtonItem *buscar = [[UIBarButtonItem alloc]initWithCustomView:search];
    NSMutableArray *as=[[NSMutableArray alloc]initWithObjects:buscar, nil];
    self.navigationController.topViewController.navigationItem.rightBarButtonItems = as;
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(25, 100,self.view.frame.size.width -50 , 60)];
    img.image=[UIImage imageNamed:@"logo.png"];
    [self.view addSubview:img];
    
    
    UIView *a=[[UIView alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height/2 -100, self.view.frame.size.width-100, 100)];
    a.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:a];
    UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, a.frame.size.width, 35)];
    lbl1.text=@"¿Te puede infraccionar?";
    lbl1.textAlignment=NSTextAlignmentCenter;
    [a addSubview:lbl1];
    UIView *linea1=[[UIView alloc]initWithFrame:CGRectMake(10, 36, a.frame.size.width-20, 3)];
    linea1.backgroundColor=[UIColor yellowColor];
    [a addSubview:linea1];
    
    UILabel *desc1=[[UILabel alloc]initWithFrame:CGRectMake(0, linea1.frame.origin.y+linea1.frame.size.height, a.frame.size.width, 35)];
    desc1.text=@"Consulta la lista oficial de tránsito que puede infraccionarte.";
    desc1.numberOfLines=5;
    desc1.font=[UIFont systemFontOfSize:12];
    desc1.textColor=[UIColor lightGrayColor];
    desc1.textAlignment=NSTextAlignmentCenter;
    [a addSubview:desc1];
    
    
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(infracciones)];
    [a addGestureRecognizer:singleFingerTap];
    
    
    
    //botón 2
    UIView *b=[[UIView alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height/2 +100, self.view.frame.size.width-100, 100)];
    b.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:b];
    
    
    
    UILabel *lbl2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, a.frame.size.width, 35)];
    lbl2.text=@"Consulta tu infracción";
    lbl2.textAlignment=NSTextAlignmentCenter;
    [b addSubview:lbl2];
    UIView *linea2=[[UIView alloc]initWithFrame:CGRectMake(10, 36, a.frame.size.width-20, 3)];
    linea2.backgroundColor=[UIColor yellowColor];
    [b addSubview:linea2];

    UILabel *desc2=[[UILabel alloc]initWithFrame:CGRectMake(0, linea2.frame.origin.y+linea2.frame.size.height, a.frame.size.width, 35)];
    desc2.text=@"Consulta la multa que debes pagar por la infracción que cometiste.";
    desc2.numberOfLines=5;
    desc2.font=[UIFont systemFontOfSize:12];
    desc2.textColor=[UIColor lightGrayColor];
    desc2.textAlignment=NSTextAlignmentCenter;
    [b addSubview:desc2];
    
    
    
    
    UITapGestureRecognizer *singleFingerTap2 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(agentes)];
    [b addGestureRecognizer:singleFingerTap2];
    
    
    
    
    
      self.view.backgroundColor=[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    

    //[ self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [ self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1]];
    
    
   [[[ self navigationController] navigationBar] setBarStyle:UIBarStyleBlackTranslucent];
    
   // [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //self.navigationController.topViewController.navigationItem.title=@"";

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


-(void)infracciones{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     AirlineTableViewController *list=[storyboard instantiateViewControllerWithIdentifier:@"Airline"];
    [self.navigationController pushViewController:list animated:NO];

}

-(void)agentes{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ConceptosTableViewController *concept=[storyboard instantiateViewControllerWithIdentifier:@"concept"];
    [self.navigationController pushViewController:concept animated:NO];
    
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
