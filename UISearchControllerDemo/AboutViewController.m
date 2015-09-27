//
//  AboutViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 15/06/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController  ()<UITextViewDelegate>


@end

@implementation AboutViewController

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-75, 75, 150, 150)];
    logo.image=[UIImage imageNamed:@"citydevs.png"];
    [self.view addSubview:logo];
    UITextView *text=[[UITextView alloc]initWithFrame:CGRectMake(15, logo.frame.size.height+logo.frame.origin.y+10, self.view.frame.size.width-30, self.view.frame.size.height-200)];
    text.editable=FALSE;
    
    text.text=@"In/Fracción es una app que te permite consultar, evaluar y conocer el proceso de infracción según la información oficial brindada por la Secretaría de Seguridad Pública de la Ciudad de México. \n \nConoce más aplicaciones visitando www.citydevs.mx";
    
    //text.text=@"In/Fracción es una app que te permite consultar, evaluar y conocer el proceso de infracción según la información oficial brindada por la Secretaría de Seguridad Pública de la Ciudad de México.\n * Si un agente de tránsito te detiene, puedes consultar su nombre o número de placa y saber si tiene la facultad para levantar una infracción. \n * Si cometiste una infracción evalúa el proceso que el agente siguió en base al artículo 39 del Reglamento de Tránsito Metropolitano. \n * Consulta el monto total y las sanciones que debes pagar por la infracción que cometiste.";
    [text setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:15]];
    text.editable = NO;
    text.delegate=self;
    text.dataDetectorTypes = UIDataDetectorTypeAll;
    [self.view addSubview:text];
   
    [text setTintColor:[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1]];
    
    text.scrollEnabled=FALSE;
    text.textAlignment=NSTextAlignmentCenter;
    
    
    
    //  text.attributedText =attrib;
    [text sizeToFit];
    
    
    self.navigationController.topViewController.navigationItem.title=@"Acerca de";
    self.navigationController.navigationBar.backItem.title=@"";
    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    
    
    self.navigationController.topViewController.navigationItem.title=@"Acerca de";
    self.navigationController.navigationBar.backItem.title=@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
