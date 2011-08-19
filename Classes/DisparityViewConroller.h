//
//  DisparityViewConroller.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import <extThree20XML/extThree20XML.h>
#import "MBProgressHUD.h"
#import "DownData.h"
#import "DisparityCell.h"
#import "DataManager.h" 
#import "DisparityDetailController.h"

@interface DisparityViewConroller : UITableViewController {

	DownData					*downdata;
	MBProgressHUD				*HUD;
	NSMutableArray				*save_result;
	DisparityDetailController   *detailview;

}

@property (nonatomic, retain) MBProgressHUD				*HUD;
@property (nonatomic, retain) DownData					*downdata;
@property (nonatomic, retain) NSMutableArray			*save_result;

-(void)viewinit;
-(void)showProgressBar;
-(void)hudWasHidden:(MBProgressHUD *)hud;

@end
