//
//  ConceptsTableViewCell.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 21/06/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ConceptsTableViewCell.h"

@implementation ConceptsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        // Initialization code
        UIView *selectedView = [[UIView alloc]init];
        selectedView.backgroundColor = [UIColor clearColor];//[UIColor colorWithRed:0 green:0 blue:255 alpha:0.3];
        NSLog(@"%f",self.frame.size.width);
        float a= [[UIScreen mainScreen] bounds].size.width;
        NSLog(@"%f",a);
        _concepto = [[UILabel alloc] initWithFrame:CGRectMake(10,10,a-20,100)];
        _concepto.backgroundColor=[UIColor clearColor];
         [_concepto setFont:[UIFont fontWithName:@"OpenSans-Bold" size:17]];
        _monto= [[UILabel alloc] initWithFrame:CGRectMake(15,200,a-30,50)];
        _monto.textColor=[UIColor darkGrayColor];
        _corralon= [[UILabel alloc] initWithFrame:CGRectMake(15,240,a-30,50)];
           _corralon.textColor=[UIColor darkGrayColor];
        
        [self addSubview:_concepto];
        [self addSubview:_monto];
         [self addSubview:_corralon];
    }
    return self;
}

@end
