//
//  RateViewController.h
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 19/05/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ViewController.h"

@interface RateViewController : ViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *plate;
@end
