//
//  AgenteTableViewCell.m
//  UISearchControllerDemo
//
//  Created by Carlos Castellanos on 15/05/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "AgenteTableViewCell.h"

@implementation AgenteTableViewCell

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
        _nombre = [[UILabel alloc] initWithFrame:CGRectMake(15,0,a-30,200)];
        _nombre.numberOfLines=3;
         [_nombre setFont:[UIFont fontWithName:@"OpenSans-Bold" size:17]];
        _placa= [[UILabel alloc] initWithFrame:CGRectMake(15,2,a-30,100)];
        
        
        [self addSubview:_nombre];
        [self addSubview:_placa];
    }
    return self;
}

@end
