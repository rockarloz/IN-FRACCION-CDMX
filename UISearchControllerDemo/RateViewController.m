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
    paginas=6;
   
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(10, 74, self.view.frame.size.width-20, 100)];
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
    scroll.pagingEnabled=YES;
    scroll.scrollEnabled=YES;
    scroll.backgroundColor=[UIColor whiteColor];
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * paginas,self.view.frame.size.height/2);
   
    _pagecontrol=[[UIPageControl alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height-20, 80, 10)];
    _pagecontrol.tintColor=[UIColor colorWithRed:53/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    _pagecontrol.backgroundColor=[UIColor redColor];

    
    _pagecontrol.numberOfPages=paginas;
    
    for (int i = 0; i < 6; i++) {
        
        if (i==0) {
            UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i)+15,10 ,self.view.frame.size.width-30,40)];
            texto.numberOfLines=3;
            texto.text=@"¿El oficial se identificó con su nombre y número de placa?";
             texto.textAlignment=NSTextAlignmentCenter;
            [texto sizeToFit];
            texto.textColor=[UIColor grayColor];
           
            [scroll addSubview:texto];
            
            UIButton *paloma=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-20, texto.frame.size.height+texto.frame.origin.y+20, 40, 40)];
            [scroll addSubview:paloma];
            paloma.backgroundColor=[UIColor redColor];
        }
        else if (i==1) {
            UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i)+15,10 ,self.view.frame.size.width-30,40)];
            texto.numberOfLines=3;
            texto.text=@"¿El oficial señaló la infracción cometida?";
            [texto sizeToFit];
            [scroll addSubview:texto];
        }
        else if (i==2) {
            UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i)+15,10 ,self.view.frame.size.width-30,40)];
            texto.numberOfLines=3;
            texto.text=@"¿El oficial mostró el articulo del reglamento que lo fundamenta?";
            [texto sizeToFit];
            [scroll addSubview:texto];
        }
        else if (i==3) {
            UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i)+15,10 ,self.view.frame.size.width-30,40)];
            texto.numberOfLines=3;
            texto.text=@"¿La sanción coincidió con la infracción mostrada?";
            [texto sizeToFit];
            [scroll addSubview:texto];
        }
        else if (i==4) {
            UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i)+15,10 ,self.view.frame.size.width-30,40)];
            texto.numberOfLines=3;
            texto.text=@"¿El oficial solicitó y devolvió documentos?";
            [texto sizeToFit];
            [scroll addSubview:texto];
        }
        else if (i==5) {
            UILabel *texto=[[UILabel alloc]initWithFrame:CGRectMake((scroll.frame.size.width * i)+15,10 ,self.view.frame.size.width-30,40)];
            texto.numberOfLines=3;
            texto.text=@"¿El oficial entregó copia de la infracción?";
            [texto sizeToFit];
            [scroll addSubview:texto];
        }
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
