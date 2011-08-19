//
//  HelpInfo.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Caution.h"
#import "DevInfo.h"

@interface HelpInfo : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	IBOutlet UITableView *tableview;
}

@property (nonatomic, retain) IBOutlet UITableView *tableview;

@end
