//
//  DevInfo.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 19..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DevInfo : UITableViewCell {

	IBOutlet UILabel *name;
	IBOutlet UITextView *mailurl;
}

@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UITextView *mailurl;

@end
