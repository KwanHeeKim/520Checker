//
//  CheckerViewController.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 15..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <extThree20XML/extThree20XML.h>
#import <Three20/Three20.h>
#import "DownData.h"
#import "Calculate.h"
#import "DataManager.h"
#import <AudioUnit/AudioUnit.h>
#import "CaulyViewController.h"

@interface CheckerViewController : UIViewController <TTURLRequestDelegate>{

	NSInteger					*select_number;
	IBOutlet UIPickerView		*picker;
	NSMutableArray				*stringArr;
	NSMutableArray				*joe_stringArr;
	NSMutableArray				*save_result;
	NSString					*result;
	
	IBOutlet UITextField		*joe;
	IBOutlet UITextField		*num1;
	IBOutlet UITextField		*num2;
	IBOutlet UITextField		*num3;
	IBOutlet UITextField		*num4;
	IBOutlet UITextField		*num5;
	IBOutlet UITextField		*num6;
	
	AVAudioPlayer				*player;
	AVAudioPlayer				*player2;
	
	
	 

}

@property (nonatomic, assign) NSInteger					*select_number;
@property (nonatomic, retain) IBOutlet UIPickerView		*picker;
@property (nonatomic, retain) NSMutableArray			*stringArr;
@property (nonatomic, retain) NSMutableArray			*joe_stringArr;
@property (nonatomic, retain) NSMutableArray			*save_result;
@property (nonatomic, copy)   NSString					*result;

@property (nonatomic, retain) IBOutlet UITextField		*joe;
@property (nonatomic, retain) IBOutlet UITextField		*num1;
@property (nonatomic, retain) IBOutlet UITextField		*num2;
@property (nonatomic, retain) IBOutlet UITextField		*num3;
@property (nonatomic, retain) IBOutlet UITextField		*num4;
@property (nonatomic, retain) IBOutlet UITextField		*num5;
@property (nonatomic, retain) IBOutlet UITextField		*num6;
 

 
-(void)RequestData;
-(void)initDataString;
-(void)clearTextFeild;
-(void)ChekMyNumber;
-(void)setSoundCelebration;
-(void)requestAd;
 
 

@end
