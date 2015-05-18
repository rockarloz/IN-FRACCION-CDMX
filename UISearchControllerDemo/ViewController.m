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
    
    
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(infracciones)];
    [a addGestureRecognizer:singleFingerTap];
    
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

    
    
    
    
    UIButton* agentes = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [agentes addTarget:self
                 action:@selector(goToAgentes:)
       forControlEvents:UIControlEventTouchUpInside];
    [agentes setTitle:@"¿Te puede infraccionar?" forState:UIControlStateNormal];
    agentes.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
   // [self.view addSubview:agentes];
    
    
    
    
    UIButton* conceptos = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [conceptos addTarget:self
                action:@selector(goToConcepts:)
      forControlEvents:UIControlEventTouchUpInside];
    [conceptos setTitle:@"revisa tu infraccion" forState:UIControlStateNormal];
    conceptos.frame = CGRectMake(80.0, 100.0, 160.0, 40.0);
   // [self.view addSubview:conceptos];
    self.view.backgroundColor=[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
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

-(void)infracciones{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     AirlineTableViewController *list=[storyboard instantiateViewControllerWithIdentifier:@"Airline"];
    [self.navigationController pushViewController:list animated:NO];

}

-(void)agentes{
    
    
    
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
