//
//  DisparityDetailDownCell.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DisparityDetailDownCell : UITableViewCell {
	IBOutlet UILabel *grade;
	IBOutlet UILabel *prize;
	IBOutlet UILabel *number;
}

@property (nonatomic, retain) IBOutlet UILabel *grade;
@property (nonatomic, retain) IBOutlet UILabel *prize;
@property (nonatomic, retain) IBOutlet UILabel *number;


@end
