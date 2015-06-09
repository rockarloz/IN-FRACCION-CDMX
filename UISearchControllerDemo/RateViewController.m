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
    UIScrollView *scroll;
}
- (void)viewDidLoad {
    paginas=5;
   
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, 100)];
    name.text=_name;
    name.numberOfLines=3;
    [name setFont:[UIFont boldSystemFontOfSize:28]];
    name.textColor=[UIColor whiteColor];
    [self.view addSubview:name];
    [name sizeToFit];
    
    UILabel *plate=[[UILabel alloc]initWithFrame:CGRectMake(10, name.frame.size.height+name.frame.origin.y+10, self.view.frame.size.width-20, 100)];
    plate.text=_plate;
    plate.textColor=[UIColor whiteColor];
    plate.numberOfLines=3;
    [plate setFont:[UIFont boldSystemFontOfSize:27]];
    [self.view addSubview:plate];
    [plate sizeToFit];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,  self.view.frame.size.height/2-5, self.view.frame.size.width, 5)];
    line.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:line];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];

    
   scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    scroll.delegate=self;
    scroll.scrollEnabled=YES;
    scroll.backgroundColor=[UIColor whiteColor];
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * paginas,self.view.frame.size.height/2);
   
    _pagecontrol=[[UIPageControl alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-80, 10, 10)];
    _pagecontrol.tintColor=[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    

    
    _pagecontrol.numberOfPages=paginas;
    
    for (int i = 0; i < 5; i++) {
        
        UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i),10 ,40,40)];
        texto.text=@"Texto";
        [scroll addSubview:texto];
        
    }
    
    [self.view addSubview:scroll];
    
    [self.view addSubview:_pagecontrol];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scroll.frame.size.width;
    int page = floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pagecontrol.currentPage = page;
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
