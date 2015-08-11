//
//  ConceptDescriptionViewController.h
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 11/08/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConceptDescriptionViewController : UIViewController
@property (nonatomic,strong)NSMutableDictionary *data;

@property (nonatomic,strong)IBOutlet UILabel *description;
@property (nonatomic,strong)IBOutlet UILabel *article;
@property (nonatomic,strong)IBOutlet UILabel *corralon;
@property (nonatomic,strong)IBOutlet UILabel *points;
@property (nonatomic,strong)IBOutlet UILabel *price;
@property (nonatomic, retain)NSString *from;

@end
