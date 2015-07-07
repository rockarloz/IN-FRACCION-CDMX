//
//  ConceptsTableViewCell.h
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 21/06/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConceptsTableViewCell : UITableViewCell
@property  (nonatomic,strong) IBOutlet UILabel *concepto;
@property  (nonatomic,strong) IBOutlet UILabel *monto;
@property  (nonatomic,strong) IBOutlet UILabel *corralon;

@end
