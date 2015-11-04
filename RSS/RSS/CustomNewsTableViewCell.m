//
//  CustomNewsTableViewCell.m
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "CustomNewsTableViewCell.h"

@implementation CustomNewsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.LB_title.translatesAutoresizingMaskIntoConstraints=NO;
        self.LB_description.translatesAutoresizingMaskIntoConstraints=NO;
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView layoutIfNeeded];
    self.LB_description.preferredMaxLayoutWidth = CGRectGetWidth(self.LB_description.frame);
}

@end
