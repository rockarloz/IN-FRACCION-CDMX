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
    self.navigationController.topViewController.navigationItem.title=@"Infracción";
    UIButton *search =  [UIButton buttonWithType:UIButtonTypeInfoLight];
    //[search setImage:[UIImage imageNamed:@"df.png"] forState:UIControlStateNormal];
    [search addTarget:self action:@selector(gotoAbout) forControlEvents:UIControlEventTouchUpInside];
    
    [search setFrame:CGRectMake(0, 0, 25 , 25)];
    UIBarButtonItem *buscar = [[UIBarButtonItem alloc]initWithCustomView:search];
    NSMutableArray *as=[[NSMutableArray alloc]initWithObjects:buscar, nil];
    self.navigationController.topViewController.navigationItem.rightBarButtonItems = as;
    
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-60, 70,120, 80)];
    if ( [[UIScreen mainScreen] bounds].size.height <=480) {
        img.frame=CGRectMake(self.view.frame.size.width/2-40, 70,80, 50);
    }
    img.backgroundColor=[UIColor clearColor];
    img.image=[UIImage imageNamed:@"gorra.png"];
    img.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:img];
  
    
    UIView *a=[[UIView alloc]initWithFrame:CGRectMake(50,  img.frame.origin.y+img.frame.size.height, self.view.frame.size.width-100, 100)];
    a.backgroundColor=[UIColor clearColor];
    [self.view addSubview:a];
    UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, a.frame.size.width, 35)];
    lbl1.text=@"¿Te puede infraccionar?";
    [lbl1 setFont:[UIFont fontWithName:@"OpenSans-Bold" size:17]];
    lbl1.textAlignment=NSTextAlignmentCenter;
    lbl1.textColor=[UIColor whiteColor];
    [a addSubview:lbl1];
    UIView *linea1=[[UIView alloc]initWithFrame:CGRectMake(10, 36, a.frame.size.width-20, 3)];
    linea1.backgroundColor=[UIColor clearColor];
    [a addSubview:linea1];
    
    UILabel *desc1=[[UILabel alloc]initWithFrame:CGRectMake(0, linea1.frame.origin.y+linea1.frame.size.height, a.frame.size.width, 35)];
    [desc1 setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:12]];
    desc1.text=@"Consulta la lista oficial de tránsito que puede infraccionarte.";
    desc1.numberOfLines=5;
   
    desc1.textColor=[UIColor whiteColor];
    desc1.textAlignment=NSTextAlignmentCenter;
    [a addSubview:desc1];
    
    
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(infracciones)];
    [a addGestureRecognizer:singleFingerTap];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 addTarget:self
               action:@selector(infracciones)
     forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"Busca un Agente" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:12];

    button2.backgroundColor=[UIColor colorWithRed:252/255.0 green:245/255.0 blue:6/255.0 alpha:1];

    button2.frame = CGRectMake(80.0, a.frame.size.height+a.frame.origin.y, 160.0, 40.0);
    button2.tintColor=[UIColor blackColor];
    button2.layer.cornerRadius = 8.0f;
    button2.layer.masksToBounds = YES;
   /* UIImage *buttonImagePressed = [UIImage imageNamed:@"boton.png"];
    UIImage *strechableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    
    [button2 setBackgroundImage:strechableButtonImagePressed forState:UIControlStateNormal];
    */
    //button.layer.borderWidth = 1.0f;
    
    button2.layer.shadowColor = [UIColor clearColor].CGColor;
    button2.layer.shadowOpacity = 0.8;
    button2.layer.shadowRadius = 12;
    button2.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
    button2.frame=CGRectMake(self.view.frame.size.width/2-button2.frame.size.width/2, button2.frame.origin.y, button2.frame.size.width, button2.frame.size.height);
    [self.view addSubview:button2];
    
    
    //botón 2
    
    UIImageView *cell=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30,self.view.frame.size.height/2+10,60 , 80)];
    
    if ( [[UIScreen mainScreen] bounds].size.height <=480) {
        cell.frame=CGRectMake(self.view.frame.size.width/2-20,button2.frame.origin.y+button2.frame.size.height+10,40 , 50);
    }

    cell.backgroundColor=[UIColor clearColor];
    cell.image=[UIImage imageNamed:@"infraccion.png"];
    cell.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:cell];
    
    UIView *b=[[UIView alloc]initWithFrame:CGRectMake(50, cell.frame.size.height+cell.frame.origin.y, self.view.frame.size.width-100, 100)];
    b.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:b];
    
    
    
    UILabel *lbl2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, a.frame.size.width, 35)];
    lbl2.text=@"Consulta tu infracción";
     [lbl2 setFont:[UIFont fontWithName:@"OpenSans-Bold" size:17]];
    lbl2.textAlignment=NSTextAlignmentCenter;
    lbl2.textColor=[UIColor whiteColor];
    [b addSubview:lbl2];
    UIView *linea2=[[UIView alloc]initWithFrame:CGRectMake(10, 36, a.frame.size.width-20, 3)];
    linea2.backgroundColor=[UIColor clearColor];
    [b addSubview:linea2];

    UILabel *desc2=[[UILabel alloc]initWithFrame:CGRectMake(0, linea2.frame.origin.y+linea2.frame.size.height, a.frame.size.width, 35)];
    desc2.text=@"Consulta la multa que debes pagar por la infracción que cometiste.";
    desc2.numberOfLines=5;
    [desc2 setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:12]];
    desc2.textColor=[UIColor whiteColor];
    desc2.textAlignment=NSTextAlignmentCenter;
    [b addSubview:desc2];
    
    
    
    
    UITapGestureRecognizer *singleFingerTap2 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(agentes)];
    [b addGestureRecognizer:singleFingerTap2];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(agentes)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Busca una infracción" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:12];
    button.backgroundColor=[UIColor colorWithRed:252/255.0 green:245/255.0 blue:6/255.0 alpha:1];
    button.frame = CGRectMake(80.0, b.frame.size.height+b.frame.origin.y, 160.0, 40.0);
    button.tintColor=[UIColor blackColor];
    button.layer.cornerRadius = 8.0f;
    button.layer.masksToBounds = YES;
    //button.layer.borderWidth = 1.0f;
    
    button.layer.shadowColor = [UIColor clearColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
    button.frame=CGRectMake(self.view.frame.size.width/2-button.frame.size.width/2, button.frame.origin.y,button.frame.size.width, button.frame.size.height);
    [self.view addSubview:button];
    
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
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.topViewController.navigationItem.title=@"Infracción";
   
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
