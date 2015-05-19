//
//  RateViewController.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 19/05/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "RateViewController.h"

@interface RateViewController ()

@end

@implementation RateViewController
{
    int paginas;
}
- (void)viewDidLoad {
    paginas=5;
   
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blueColor];
    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    scroll.delegate=self;
    scroll.scrollEnabled=YES;
    scroll.backgroundColor=[UIColor whiteColor];
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * paginas,self.view.frame.size.height/2);
    for (int i = 0; i < 5; i++) {
        
        UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i),10 ,40,40)];
        texto.text=@"Texto";
        [scroll addSubview:texto];
        
    }
    
    [self.view addSubview:scroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
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
