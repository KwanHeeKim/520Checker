//
//  DisparityCell.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "DisparityCell.h"


@implementation DisparityCell

@synthesize inning;
@synthesize inningtime;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


-(void)setCellStyle:(DisparityCell *)cell{
	
	cell.inning.backgroundColor = [UIColor clearColor];	
	[cell.inning setFont:[UIFont boldSystemFontOfSize:20.0]];
	
	
	
	cell.inningtime.backgroundColor = [UIColor clearColor];
	[cell.inningtime setFont:[UIFont boldSystemFontOfSize:25.0]];
	
}


@end
