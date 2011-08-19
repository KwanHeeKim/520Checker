//
//  DisparityDetailController.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import <extThree20XML/extThree20XML.h>
#import "DownData.h"
#import "DataManager.h"

#import "DisparityDetailUpCell.h"
#import "DisparityDetailDownCell.h"
#import "DisparityDetailMiddelCell.h"
#import "DisparityDetailHeaderCell.h"
#import "DisparityDetailFooterCell.h"



@interface DisparityDetailController : UITableViewController <TTURLRequestDelegate>{
 
	NSString				*inning;
	NSString				*inningtime;
	 
	NSMutableArray			*save_result;
	DataManager				*datamanager;
	DownData				*tempdata;
 
	
}

@property (nonatomic, copy)	  NSString					*inning;
@property (nonatomic, copy)   NSString					*inningtime;
@property (nonatomic, retain) NSMutableArray			*save_result;
@property (nonatomic, retain) DataManager				*datamanager;



-(void)RequestData:(NSString *)select_number;
-(void)initView;
 

@end
