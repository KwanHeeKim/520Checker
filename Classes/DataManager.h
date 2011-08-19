//
//  DataManager.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MBProgressHUD.h"


@interface DataManager : NSObject {

	
	NSMutableArray				*save_data;
	MBProgressHUD				*HUD;
 
}

@property (nonatomic, retain) 	NSMutableArray					*save_data;
@property (nonatomic, retain)   MBProgressHUD					*HUD;
 

+(DataManager *)getDataInstance;
-(void)showProgressBar:(UIView *)_view CallviewID:(id)_id;
-(void)hudWasHidden:(MBProgressHUD *)hud;
-(void)initobjects;


@end
