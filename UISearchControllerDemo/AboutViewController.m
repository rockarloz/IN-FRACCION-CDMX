//
//  AboutViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 15/06/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {

    UITextView *text=[[UITextView alloc]initWithFrame:CGRectMake(15, 100, self.view.frame.size.width-30, self.view.frame.size.height-200)];
    text.editable=FALSE;
    text.text=@"Infracción es una aplicacion desarrollada por CityDevs, utiliza datos de SSP.";
    [self.view addSubview:text];
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
