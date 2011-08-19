//
//  Pension520CheckerAppDelegate.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 13..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "Pension520CheckerAppDelegate.h"

@implementation Pension520CheckerAppDelegate

@synthesize window;
@synthesize mainview;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	[self AppinitView];
	[self.window addSubview:tabbarController.view];
    [self.window makeKeyAndVisible];
	[self AddCaulyAD];
 
 
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navi release];
	[help_navi release];
	[disparity_navi release];
	[navi release];
    [window release];
    [super dealloc];
	

}
  

-(void)AppinitView{
	
	
	
	
	navi = [[UINavigationController alloc]initWithRootViewController:mainview];
	mainview.title=@"조회"; 
	navi.title=@"조회";
	[navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
	[navi.tabBarItem initWithTabBarSystemItem:UITabBarSystemItemSearch tag:800];
	
	disparity_navi = [[UINavigationController alloc]initWithRootViewController:[[DisparityViewConroller alloc]init]];
	disparity_navi.title=@"추첨결과";
	[disparity_navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
	[disparity_navi.tabBarItem initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:802];
	
	HelpInfo *helpview = [[HelpInfo alloc]init];
	help_navi = [[UINavigationController alloc]initWithRootViewController:helpview];
	help_navi.title=@"정보";
	[help_navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
	[help_navi.tabBarItem initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:803];
	
	
	tabbarController = [[UITabBarController alloc]init];
	tabbarController.viewControllers = [NSArray arrayWithObjects:navi, disparity_navi, help_navi,nil];
	

	
	
}




#pragma mark -


- (void)AddCaulyAD {
	
	
	
	[CaulyViewController initCauly:self setLogLevel:CL_RELEASE];	// 카울리 로그를 남기도록 설정
	
	
	float yPos =tabbarController.view.frame.size.height-48-48;
	NSLog(@" yPos %f ", yPos);
	
	if ([CaulyViewController requestBannerADWithViewController:tabbarController xPos:0 yPos:50 adType:BT_IPHONE]==FALSE) {
		NSLog(@"requestbanner ad failed");
	}
 
	
}

#pragma mark CaulyProtocol method

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// 주! 아래 카울리 프로토콜 구현 메소드의 리턴값에 특수문자나 공백이 들어가 있으면 광고정보를 정상적으로 못 얻어 옵니다.    //
////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSString *) devKey 
{
	//return @"CAULY"; //CAULY는 테스트용 개발코드입니다. 제품 배포시에는 발급받은 어플리케이션 고유개발코드로 변환해 주세요.
	return @"CMEbZtarE";
}

// 성별 값을 리턴합니다. "male", "female", "all"
- (NSString *) gender
{
	return @"all";	// 공백이나 특수문자는 사용할 수 없습니다.
}

// 나이 값을 리턴합니다. "all", "10", "20", "30", "40", "50"
- (NSString *) age
{
	return @"all";	// 공백이나 특수문자는 사용할 수 없습니다.
}

// 카울리 시스템이 위치 정보를 수집하도록 설정합니다.
// 카울리 시스템이 위치 정보를 수집할 경우 사용자에 맞는 광고를 내 보내주게 되고 이를 통해 광고 수입이 늘어 날 수 있게 됩니다.
- (BOOL) getGPSInfo
{
	//	return TRUE; // 리턴값을 TRUE로 하게되면 사용자들로 하여금 위치 정보 승인을 물어보게 됩니다.
	return FALSE;
}

// 광고 교체 주기값을 설정합니다.
- (REFRESH_PERIOD) rollingPeriod {
	return SEC_30;
}

// 광고가 바뀔 때의 효과를 설정합니다.
- (ANIMATION_TYPE) animationType {
	return FADEOUT;
}

// 광고 데이터를 받고 나면 호출됩니다.
- (void)AdReceiveCompleted {
	NSLog(@"AdReceiveCompleted..");
}

// 광고 데이터를 받는데 실패하면 호출됩니다.
- (void)AdReceiveFailed {
	NSLog(@"AdReceiveFailed..");
}

// 전면 광고를 종료시키면 호출됩니다.
// 만약 전면 광고를 요청하지 않을 경우 이 메소드는 호출되지 않습니다.
// 전면 광고와 배너 광고를 동시에 노출 시킬 수 없으므로 전면 광고가 종료된 뒤 배너 광고를 노출시키기 바랍니다.
- (void)closeCPMAd {
	NSLog(@"배너광고 노출");
	
	// 이 예제의 경우 requestBannerADWithViewController 메소드를 이용하였습니다.
	// 만약 viewController를 사용하지 않는 앱의 경우 아래와 같이 requestBannerADWithView메소드를 이용하시기 바랍니다.
	// 예) [CaulyViewController requestBannerADWithView:parentView xPos:0 yPos:0]
	
	//	if( [CaulyViewController requestBannerADWithView:viewController.view xPos:0 yPos:0 adType:BT_IPHONE] == FALSE ) {
	 
	// 배너 광고 회전 예제
	//	if( [CaulyViewController rotateCaulyBannerView:UIInterfaceOrientationLandscapeRight] == FALSE ) {
	//		NSLog(@"caulyView rotation failed");
	//	}
	
}

 


@end
