//
//  DescriptionViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 19/05/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
   // [super viewDidLoad];
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, 100)];
    name.text=@"Sandra Nayeli Barron Barron";
    name.numberOfLines=3;
    [name setFont:[UIFont boldSystemFontOfSize:28]];
    name.textColor=[UIColor grayColor];
    [self.view addSubview:name];
    [name sizeToFit];
    
    UILabel *plate=[[UILabel alloc]initWithFrame:CGRectMake(10, name.frame.size.height+name.frame.origin.y+10, self.view.frame.size.width-20, 100)];
    plate.text=@"Placa:12345";
    plate.textColor=[UIColor lightGrayColor];
    plate.numberOfLines=3;
    [plate setFont:[UIFont boldSystemFontOfSize:27]];
    [self.view addSubview:plate];
    [plate sizeToFit];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(10,  plate.frame.size.height+plate.frame.origin.y+10, self.view.frame.size.width-20, 5)];
    line.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:line];
    
    UILabel *txt=[[UILabel alloc]initWithFrame:CGRectMake(10, line.frame.size.height+line.frame.origin.y+10, self.view.frame.size.width-20, 100)];
    txt.text=@"Este agente sí tiene la facultad para infracionarte.";
    txt.textColor=[UIColor blackColor];
    txt.numberOfLines=3;
    [txt setFont:[UIFont boldSystemFontOfSize:15]];
    [self.view addSubview:txt];
    [txt sizeToFit];
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *btn=[[UIView alloc]initWithFrame:CGRectMake(15, self.view.frame.size.height-90, self.view.frame.size.width-30, 70)];
    btn.backgroundColor=[UIColor yellowColor];
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height)];
    lbl.text=@"Evalúa el proceso de infracción.";
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.textColor=[UIColor blackColor];
    [lbl setFont:[UIFont boldSystemFontOfSize:14]];
    [btn addSubview:lbl];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
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
