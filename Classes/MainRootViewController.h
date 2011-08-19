//
//  MainRootViewController.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 13..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import <Three20/Three20.h>
#import <extThree20XML/extThree20XML.h>
#import "CheckerViewController.h"
#import "MBProgressHUD.h"
#import "DataManager.h"
#import <AudioUnit/AudioUnit.h>
#import "CaulyViewController.h"
 


@interface MainRootViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, TTURLRequestDelegate>{

	
	DataManager					*datamanager;
	NSMutableArray				*save_result;
	AVAudioPlayer				*player;
 

  
}

@property (nonatomic, retain) IBOutlet iCarousel			*carousel;
@property (nonatomic, retain) CheckerViewController			*checkerView;
@property (nonatomic, retain) DataManager					*datamanager;
@property (nonatomic, retain) NSMutableArray				*save_result;
 
-(void)RequestData;
-(void)requestAd;

@end
