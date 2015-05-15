//
//  PersonDetailViewController.h
//  FRACCION-CDMX
//
//  Created by Carlos Castellanos on 08/03/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonDetailViewController : UIViewController
@property (nonatomic,retain) NSMutableDictionary *data;


@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *plate;

@end
