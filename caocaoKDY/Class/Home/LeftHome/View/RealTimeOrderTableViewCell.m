//
//  RealTimeOrderTableViewCell.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/14.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "RealTimeOrderTableViewCell.h"

@interface RealTimeOrderTableViewCell()
/**
 *  蒙版
 */
@property (weak, nonatomic) IBOutlet UIView *maskView;

@end

@implementation RealTimeOrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)layoutSubviews {
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    self.maskView.layer.cornerRadius = 5;
    self.maskView.layer.masksToBounds = NO;

}

@end
