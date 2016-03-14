//
//  TuanMangerTableViewCell.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/14.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "TuanMangerTableViewCell.h"

@interface TuanMangerTableViewCell()
/**
 *  <#Description#>
 */
@property (weak, nonatomic) IBOutlet UIView *maskView;

@end

@implementation TuanMangerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews {
    self.maskView.layer.cornerRadius = 5.0f;
    self.maskView.layer.masksToBounds = NO;
}

@end
