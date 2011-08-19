//
//  CheckerViewController.m

//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 15..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "CheckerViewController.h"


@implementation CheckerViewController
 
@synthesize select_number;
@synthesize picker;
@synthesize joe,num1, num2, num3, num4, num5, num6;
@synthesize joe_stringArr;
@synthesize save_result;
@synthesize stringArr;
@synthesize result;

 
 

-(void)viewDidLoad
{
	[super viewDidLoad];
	
	UIBarButtonItem *confirm = [[UIBarButtonItem alloc]initWithTitle:@"확인" 
				style:UIBarButtonItemStyleBordered target:self action:@selector(ChekMyNumber)];
	self.navigationItem.rightBarButtonItem = confirm;
	
	
	[self initDataString];
	
	
 
}


-(void)viewDidAppear:(BOOL)animated
{
	NSLog(@"viewDidAppear selected int %d", select_number);
	self.title = [NSString stringWithFormat:@"%d회차", select_number ];
	[self clearTextFeild];
	[self RequestData];
	[self requestAd];
	
}
 

#pragma mark TTURLRequest

- (void)requestDidFinishLoad:(TTURLRequest*)request {
	NSLog(@"requestDidFinishLoad");
	TTURLXMLResponse *response = request.response;
	TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]);
	NSDictionary* feed = response.rootObject;
	
//	NSLog(@"data is %@", feed);
	TTDASSERT([[feed objectForKey:@"POST"] isKindOfClass:[NSArray class]]);
	NSArray* entries = [feed objectForKey:@"POST"];
	//NSLog(@"entries IS %@", entries);
	
	
	save_result = [[NSMutableArray alloc]initWithCapacity:[entries count]];
	
  	
	for (int i =0; i <[entries count]; i++) 
	{
		DownData *data = [[DownData alloc]init];
		NSDictionary *temp = [[NSDictionary alloc]initWithDictionary:[entries objectAtIndex:i]]; 
	 		
		data.joe = [[temp objectForKey:@"JOE"] objectForXMLNode];
		data.num1 = [[temp objectForKey:@"NUM1" ] objectForXMLNode];
		data.num2 = [[temp objectForKey:@"NUM2" ] objectForXMLNode];
		data.num3 = [[temp objectForKey:@"NUM3"] objectForXMLNode];
		data.num4 = [[temp objectForKey:@"NUM4"] objectForXMLNode];
		data.num5 = [[temp objectForKey:@"NUM5"] objectForXMLNode];
		data.num6 = [[temp objectForKey:@"NUM6"] objectForXMLNode];
	 	
		//NSLog(@"save before data is %@ , %@ %@ %@ %@ %@ %@ " , data.joe, data.num1, data.num2, data.num3, data.num4, data.num5, data.num6);
		
 		[save_result addObject:data];
		
		[data release];
		[temp release];
	}
	     
}


- (NSError*)request:(TTURLRequest*)request processResponse:(NSHTTPURLResponse*)response
			   data:(id)data{
	
	
 	return nil;
	
}

-(void)RequestData{
 
	NSLog(@"CheckerViewController RequestData selected int %d", select_number);
	
	NSString *requestURL = [NSString stringWithFormat:@"http://zakkfactory.zc.bz/test2.html?inning=%d" , select_number];
    NSLog(@"requestURL: %@", requestURL);
	
    TTURLRequest *request = [TTURLRequest requestWithURL:requestURL delegate:self];
    request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
    request.cachePolicy = TTURLRequestCachePolicyNone;
	request.httpMethod =@"POST";
	
	
    TTURLXMLResponse *response = [[TTURLXMLResponse alloc] init];
	response.isRssFeed =YES;
    request.response = response;
    TT_RELEASE_SAFELY(response);
	
    [request send];
}

 
#pragma mark  dev makedev

-(void)initDataString{
	
	stringArr= [[NSMutableArray alloc] init]; 
	joe_stringArr = [[NSMutableArray alloc]init];
	save_result = [[NSMutableArray alloc]init];
	
	for(int i = 0 ; i < 11 ; i++ )
	{
		[stringArr addObject:[NSString stringWithFormat:@"%2d", i]];
	}
	
	for(int i = 1 ; i < 10 ; i++ )
	{
		[joe_stringArr addObject:[NSString stringWithFormat:@"%d", i]];
	}
 	
	[joe setFont:[UIFont systemFontOfSize:17.0]];
	[num1 setFont:[UIFont systemFontOfSize:17.0]];
	[num2 setFont:[UIFont systemFontOfSize:17.0]];
	[num3 setFont:[UIFont systemFontOfSize:17.0]];
	[num4 setFont:[UIFont systemFontOfSize:17.0]];
	[num5 setFont:[UIFont systemFontOfSize:17.0]];
	[num6 setFont:[UIFont systemFontOfSize:17.0]];
	
	NSString *path1 = [[NSBundle mainBundle] pathForResource:@"celebrate" ofType:@"mp3"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"kkwang" ofType:@"wav"];
	
	NSURL *fileURL1 = [[NSURL alloc] initFileURLWithPath:path1];
    NSURL *fileURL2 = [[NSURL alloc] initFileURLWithPath:path2];
	 	
 	
	player =[[AVAudioPlayer alloc]initWithContentsOfURL:fileURL1 error:nil];
	player2 =[[AVAudioPlayer alloc]initWithContentsOfURL:fileURL2 error:nil];
	
	
	[player prepareToPlay];
	[player2 prepareToPlay];
}

-(void)clearTextFeild{
	
	[joe setText:@""];
	[num1 setText:@""];
	[num2 setText:@""];
	[num3 setText:@""];
	[num4 setText:@""];
	[num5 setText:@""];
	[num6 setText:@""];
	
	
}


-(void)ChekMyNumber{
	NSLog(@"ChekMyNumber");
	
	if (
		[joe.text isEqualToString:@""]   ||
		[num1.text isEqualToString:@""]  || 
		[num2.text isEqualToString:@""]  || 
		[num3.text isEqualToString:@""]  ||
		[num4.text isEqualToString:@""]  ||
		[num5.text isEqualToString:@""]  ||
		[num6.text isEqualToString:@""] 
		)
	{
		  
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"연금복권520 Chcker" message:@"번호를 입력하세요" delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
		[alert show];
	}
	//데이터를 다 입력하고 들어가는 else
	else {
		 
		//데이터를 다 받아왔을때
		if ([save_result count] >0)
		{
			NSDictionary *user_data = [[NSDictionary alloc]initWithObjectsAndKeys:
									   joe.text,  @"joe",
									   num1.text, @"num1",
									   num2.text, @"num2",
									   num3.text, @"num3",
									   num4.text, @"num4",
									   num5.text, @"num5",
									   num6.text, @"num6",
									   nil];
			
			[self setResult:[Calculate getResultData:self.save_result userWrite:user_data callId:self]];
			//NSLog(@"result is %@", result);
			
			[self performSelectorOnMainThread:@selector(setSoundCelebration) withObject:nil waitUntilDone:NO];
			UIAlertView *resultAlert = [[UIAlertView alloc]initWithTitle:@"연금복권520 Chcker" message:result delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
			[resultAlert show];
			
		}
		//입력은다햇는데 데이터를 아직다 못받아온경우 
		else {
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"연금복권520 Chcker" message:@"데이터를 다운로드 중입니다." delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
			[alert show];
		}
		
	}
 	
}


#pragma mark -
#pragma mark UIPickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
 
	return 7;
}
 
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (component ==0) {
		return 9;
	}
	else {
		return 10;
	}


}

- (NSString *)pickerView:(UIPickerView *)pickerView 
			 titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
 
	
	if (component==0) {
		return [joe_stringArr objectAtIndex:row];
	}
	else {
			return [stringArr objectAtIndex:row];
	}
  
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row 
	   inComponent:(NSInteger)component
{ 
 	if( component == 0 ){
		joe.text=[NSString stringWithFormat:@"%d", row+1];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	else if (component==1){ 
		num1.text=[NSString stringWithFormat:@"%d", row];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	else if (component==2) {
		num2.text=[NSString stringWithFormat:@"%d", row];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	else if (component==3) {
		num3.text=[NSString stringWithFormat:@"%d", row];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	else if (component==4) {
		num4.text=[NSString stringWithFormat:@"%d", row];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	else if (component==5) {
		num5.text=[NSString stringWithFormat:@"%d", row];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	else if (component==6) {
		num6.text=[NSString stringWithFormat:@"%d", row];
		//[pickerView selectRow:row inComponent:0 animated:YES];
	}
	
	 
}


-(void)setSoundCelebration{
	NSLog(@"%@", result);
	
	if ([result isEqualToString:@"1등입니다! 축하합니다!"] ||
		[result isEqualToString:@"2등입니다! 축하합니다!"] ||
		[result isEqualToString:@"3등입니다! 축하합니다!"] ||
		[result isEqualToString:@"4등입니다! 축하합니다!"] ||
		[result isEqualToString:@"5등입니다! 축하합니다!"] ||
		[result isEqualToString:@"6등입니다! 축하합니다!"] ||
		[result isEqualToString:@"7등입니다! 축하합니다!"]
	   ) 
	{
		[player play];
	}
	else {
		NSLog(@"else in");
		[player2 play];
	}
 	
} 
  
-(void)dealloc
{
	[player release];
	[player2 release];
	[picker release];
	[stringArr release];
	[joe_stringArr release];
	[save_result release];
	[result release];
	[joe release];
	[num1 release];
	[num2 release];
	[num3 release];
	[num4 release];
	[num5 release];
	[num6 release];
	select_number=nil;

	[super dealloc];
}

-(void)requestAd{
	
	/* 애드몹 
	
	// Create a view of the standard size at the bottom of the screen.
	admobView = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0,5,320,50)];
	NSLog(@"CheckerViewController bannerView_ is %@", admobView);
	// Specify the ad's "unit identifier." This is your AdMob Publisher ID.
	admobView.adUnitID = @"a14e268a9f48b42";
	
	// Let the runtime know which UIViewController to restore after taking
	// the user wherever the ad goes and add it to the view hierarchy.
	admobView.rootViewController = self;
	[self.view addSubview:admobView];
	
	// Initiate a generic request to load it with an ad.
	[admobView loadRequest:[GADRequest request]];	
	 
	 */ 
	if([CaulyViewController moveBannerAD:self caulyParentview:nil xPos:0 yPos:13]==FALSE){
		NSLog(@"requestbanner ad failed");
	}
	
	
//	if ([CaulyViewController requestBannerADWithViewController:self xPos:0 yPos:0 adType:BT_IPHONE]==FALSE) {
//		NSLog(@"requestbanner ad failed");
//	}
	
}




@end
