//
//  DisparityDetailController.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "DisparityDetailController.h"


@implementation DisparityDetailController
 
@synthesize inning;
@synthesize inningtime;
@synthesize save_result;
@synthesize datamanager;

   
 
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	 
	[self initView];
	
 	[self RequestData:inning];

	 
}
 
 
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


-(void)initView{
	
	
	NSLog(@"inn %@, instime %@ ", inning, inningtime);
	self.title=@"추첨결과";
	datamanager = [DataManager getDataInstance];
	[datamanager showProgressBar:self.view CallviewID:self];
	UIView *backgroundView = [[[UIView alloc]initWithFrame:CGRectMake(0, 44, 320, 416)]autorelease];
	backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back2.png"]];
	self.tableView.backgroundView =  backgroundView;
	
	
	
}


#pragma mark tableView 

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	if (indexPath.row==0) {
		return 100;
	}
	else if(indexPath.row==15) {
		return 80;
	}
	else 
		return 30;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ 
	 
	return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	 
	static NSString *CellIdentifier1 = @"DisparityDetailHeaderCell";
	static NSString *CellIdentifier2 = @"DisparityDetailUpCell";
	static NSString *CellIdentifier3 = @"DisparityDetailMiddelCell";
	static NSString *CellIdentifier4 = @"DisparityDetailDownCell";
	static NSString *CellIdentifier5 = @"DisparityDetailFooterCell";
	[tableView setSeparatorColor:[UIColor clearColor]];
 	 
	//indexpath.row 15이면 푸터임..
	if (indexPath.row>1 && 15 > indexPath.row) 
	{
	  		tempdata = [save_result objectAtIndex:indexPath.row-2];
		//NSLog(@"data is %@", tempdata);
		//NSLog(@" %@ %@ %@ %@ %@ %@", data.joe, data.num1, data.num2, data.num3, data.num4, data.num5);
		
		
	}
	

	
	
	
	if (indexPath.row==0) 
	{
		DisparityDetailHeaderCell *cell = (DisparityDetailHeaderCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier1];
		if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DisparityDetailHeaderCell" owner:self options:nil];
			cell = (DisparityDetailHeaderCell *)[nib objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
	 
			NSString *tempString = [[NSString alloc]initWithFormat:@"추첨일 : "];
			
			//created view
			UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 480, 60)];
			customView.backgroundColor=[UIColor clearColor];
			//NSLog(@"custromview frame is wid %f, height %f " , customView.frame.size.width, customView.frame.size.height);
			
			UILabel *inninglabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 18, 320, 30)];
			inninglabel.textAlignment =UITextAlignmentCenter;
			inninglabel.backgroundColor =[UIColor clearColor];
			inninglabel.textColor = [UIColor whiteColor];
			inninglabel.font = [UIFont systemFontOfSize:25];
			inninglabel.text =[inning stringByAppendingFormat:@" 회차"];
			
			UILabel *inning_date = [[UILabel alloc]initWithFrame:CGRectMake(0, 55, 320, 30)];
			inning_date.textAlignment = UITextAlignmentCenter;
			inning_date.backgroundColor = [UIColor clearColor];
			inning_date.textColor = [UIColor whiteColor];
			inning_date.font = [UIFont systemFontOfSize:22];
			inning_date.text = [tempString stringByAppendingFormat:inningtime];
 
			
			[cell addSubview:inning_date];
			[cell addSubview:inninglabel];
 
		return cell;
	}
	
	else if (indexPath.row==1) 
	{
		DisparityDetailUpCell *cell = (DisparityDetailUpCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier2];
		if (cell == nil)
		{
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DisparityDetailUpCell" owner:self options:nil];
			cell = (DisparityDetailUpCell *)[nib objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		
		return cell;
	}
	else if (indexPath.row==2 || indexPath.row==4 || indexPath.row==6 || indexPath.row==8 || indexPath.row==10 || indexPath.row==12 || indexPath.row==14) 
	{
		 
		DisparityDetailMiddelCell *cell = (DisparityDetailMiddelCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier3];
		if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DisparityDetailMiddelCell" owner:self options:nil];
			cell = (DisparityDetailMiddelCell *)[nib objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			 
		}
		
		if (indexPath.row==2) {
			cell.prize.text=@"500만원x20년";
			cell.grade.text=@"1등";
			
			 
		}
		else if(indexPath.row==4){
			cell.prize.text=@"100,000,000";
			cell.grade.text=@"2등"; 
		 
		}
		else if(indexPath.row==6){
			cell.prize.text=@"100,000,000";
			cell.grade.text=@"2등"; 
		 
		}
		else if(indexPath.row==8){
			cell.prize.text=@"10,000,000";
			cell.grade.text=@"3등"; 
			 
		}
		else if(indexPath.row==10){
			cell.prize.text=@"200,000";
			cell.grade.text=@"5등";
		}
		else if(indexPath.row==12){
			cell.prize.text=@"2,000";
			cell.grade.text=@"6등";
		}
		else if(indexPath.row==14){
			cell.prize.text=@"1,000";
			cell.grade.text=@"7등";
		}
		 cell.number.text =tempdata.mergeString;
		
		 
		
		
		return cell;
	}
	else if (indexPath.row==3 || indexPath.row==5 || indexPath.row==7 || indexPath.row==9 || indexPath.row==11 | indexPath.row==13 ) 
	{
				 		DisparityDetailDownCell *cell = (DisparityDetailDownCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier4];
		if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DisparityDetailDownCell" owner:self options:nil];
			cell = (DisparityDetailDownCell *)[nib objectAtIndex:0];
		 	cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		
		if (indexPath.row==3) {
			cell.prize.text=@"500만원x20년";
			cell.grade.text=@"1등";
			
		}
		else if(indexPath.row==5){
			cell.prize.text=@"100,000,000";
			cell.grade.text=@"2등"; 
		}
		else if(indexPath.row==7){
			cell.prize.text=@"100,000,000";
			cell.grade.text=@"2등"; 
		}
		else if(indexPath.row==9){
			cell.prize.text=@"10,000,000";
			cell.grade.text=@"4등"; 
		}
		else if(indexPath.row==11){
			cell.prize.text=@"2,000";
			cell.grade.text=@"6등";
		}
		else if(indexPath.row==13){
			cell.prize.text=@"1,000";
			cell.grade.text=@"7등";
		}
	 
		
		cell.number.text =tempdata.mergeString;
		return cell;
	}
 
	else if(indexPath.row==15)
	{
		DisparityDetailFooterCell *cell = (DisparityDetailFooterCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier5];
 
		if (cell==nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DisparityDetailFooterCell" owner:self options:nil];
			cell = (DisparityDetailFooterCell *)[nib objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
	 	
		return cell;
	}
	
	 
	return nil;
}

 
#pragma mark httprequest


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	NSLog(@"DisparityDetailController requestDidFinishLoad");
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
		
		if ([[temp objectForKey:@"JOE"] objectForXMLNode]) {
			data.joe = [[[temp objectForKey:@"JOE"] objectForXMLNode] stringByAppendingString:@"조 "];			
		}else {
			data.joe = @"*조 ";
		}
		
		if ([[temp objectForKey:@"NUM1"] objectForXMLNode]) {
			data.num1 = [[temp objectForKey:@"NUM1"] objectForXMLNode];			
		}else {
			data.num1 = @"* ";
		}
		
		if ([[temp objectForKey:@"NUM2"] objectForXMLNode]) {
			data.num2 = [[temp objectForKey:@"NUM2"] objectForXMLNode];			
		}else {
			data.num2 = @"* ";
		}
		
		if ([[temp objectForKey:@"NUM3"] objectForXMLNode]) {
			data.num3 = [[temp objectForKey:@"NUM3"] objectForXMLNode];			
		}else {
			data.num3 = @"* ";
		}
		
		if ([[temp objectForKey:@"NUM4"] objectForXMLNode]) {
			data.num4 = [[temp objectForKey:@"NUM4"] objectForXMLNode];			
		}else {
			data.num4 = @"* ";
		}

		if ([[temp objectForKey:@"NUM5"] objectForXMLNode]) {
			data.num5 = [[temp objectForKey:@"NUM5"] objectForXMLNode];			
		}else {
			data.num5 = @"* ";
		}
		
		if ([[temp objectForKey:@"NUM6"] objectForXMLNode]) {
			data.num6 = [[temp objectForKey:@"NUM6"] objectForXMLNode];			
		}else {
			data.num6 = @"* ";
		}
		
	  
		data.mergeString = [data.joe stringByAppendingString:[data.num1
															  stringByAppendingString:[data.num2 
															stringByAppendingString:[data.num3
															stringByAppendingString:[data.num4 
															stringByAppendingString:[data.num5
															stringByAppendingString:data.num6]]]]]];
 
		 
		//NSLog(@"merge string %@", data.mergeString);
		//NSLog(@"save before data is %@ , %@ %@ %@ %@ %@ %@ " , data.joe, data.num1, data.num2, data.num3, data.num4, data.num5, data.num6);
		
 		[save_result addObject:data];
		
		[data release];
		[temp release];
	}
	 
	[datamanager hudWasHidden:YES];
	[self.tableView reloadData];
	
}


- (NSError*)request:(TTURLRequest*)request processResponse:(NSHTTPURLResponse*)response
			   data:(id)data{
	
	
 	return nil;
	
}

-(void)RequestData:(NSString *)select_number{
	 	
	NSString *requestURL = [NSString stringWithFormat:@"http://zakkfactory.zc.bz/test2.html?inning=%d" , [select_number intValue]];
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
 

@end
