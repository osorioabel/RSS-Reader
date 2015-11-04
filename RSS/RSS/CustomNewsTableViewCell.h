//
//  CustomNewsTableViewCell.h
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *LB_title;
@property (weak, nonatomic) IBOutlet UILabel *LB_description;
@property (weak, nonatomic) IBOutlet UIImageView *IV_photo;

@end
