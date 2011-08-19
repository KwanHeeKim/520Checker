//
//  Pension520CheckerAppDelegate.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 13..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainRootViewController.h"
#import "DisparityViewConroller.h"
#import "HelpInfo.h"
#import "CaulyViewController.h"


 

@interface Pension520CheckerAppDelegate : NSObject <UIApplicationDelegate, CaulyProtocol> {
 
	UINavigationController		*navi;
	UINavigationController		*disparity_navi;
	UINavigationController		*help_navi;	
	 
	UITabBarController			*tabbarController;
	 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainRootViewController *mainview;
 
-(void)AppinitView;
-(void)AddCaulyAD;
 

@end

