    //
//  DataManager.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "DataManager.h"


@implementation DataManager

@synthesize save_data;
@synthesize HUD;
 

static DataManager			*dataManager;

+(DataManager *)getDataInstance{
	
	@synchronized(self){
		
		if (!dataManager) {
			dataManager = [[DataManager alloc]init];
			[dataManager initobjects];
			
		}
		
	}
	return dataManager;
	
}


-(void)initobjects{
	save_data = [[NSMutableArray alloc]init];
	 	 
}


- (void)dealloc {
	 
	[save_data release];
	[HUD release];
    [super dealloc];
}

-(void)showProgressBar:(UIView *)_view CallviewID:(id)_id
{
	HUD = [[MBProgressHUD showHUDAddedTo:_view animated:YES]retain];
	[_view addSubview:HUD];
	HUD.dimBackground = YES;
    HUD.delegate = self;
	[HUD showUsingAnimation:YES];
	
	
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
	[HUD hide:YES afterDelay:2];
    [HUD removeFromSuperview];
    [HUD release];
	HUD = nil;
}




@end
