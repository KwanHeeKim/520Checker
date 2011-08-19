//
//  DisparityCell.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DisparityCell : UITableViewCell {

	IBOutlet UILabel *inning;
	IBOutlet UILabel *inningtime;
}

@property (nonatomic, retain) 	IBOutlet UILabel *inning;
@property (nonatomic, retain)   IBOutlet UILabel *inningtime;

-(void)setCellStyle:(DisparityCell *)cell;

@end
